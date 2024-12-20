//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import SwiftUI

struct BikeStationsListView: View {
	
	@EnvironmentObject var locationManager: LocationManager
	
	@FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \StationEntity.name, ascending: true)], animation: .default) var stationEntities: FetchedResults<StationEntity>
	
	@StateObject var viewModel = BikeStationsListViewModel()
	
	var sortedStationEntities: [StationEntity] {
		if let userLocation = locationManager.userLocation {
			return stationEntities.sorted {
				locationManager.distance(from: userLocation, to: $0) < locationManager.distance(from: userLocation, to: $1)
			}
		} else {
			return Array(stationEntities)
		}
	}
	
	var body: some View {
		
		List(sortedStationEntities) { stationEntity in
			
			if let mapURL = stationEntity.mapURL {
				Link(destination: mapURL) {
					BikeStationRowView(stationEntity: stationEntity)
				}
			}
			
		}
		.task {
			await viewModel.getBikeStations()
		}
		.listStyle(.plain)
		.navigationTitle("Bike Stations")
		.overlay {
			if viewModel.state == .loading && sortedStationEntities.isEmpty {
				ProgressView("Loading Bike Stations...")
			} else if viewModel.state == .unsuccessful {
				ErrorView(imageName: "exclamationmark.warninglight",
									errorMessage: "An unexpected error has happened, please try again later.")
			}
		}
		.alert(isPresented: $viewModel.hasError, 
					 error: viewModel.error) {}
		
	}
	
}

#Preview {
	BikeStationsListView(viewModel: BikeStationsListViewModel(bikeStationsRequestService: BikeStationsRequestServiceMock(), bikeStationsStoreService: BikeStationsStoreService(context: PersistenceController.preview.container.viewContext)))
		.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
		.environmentObject(LocationManager())
}
