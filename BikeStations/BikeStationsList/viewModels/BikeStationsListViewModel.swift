//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

@MainActor final class BikeStationsListViewModel: ObservableObject {
	
	enum State {
		case loading
		case unsuccessful
		case successful
	}
	
	@Published private(set) var state: State = .loading
	@Published private(set) var error: ErrorType?
	@Published var hasError = false
	
	private let bikeStationsRequestService: BikeStationsRequestServiceProtocol
	private let bikeStationsStoreService: BikeStationsStoreServiceProtocol
	
	init(bikeStationsRequestService: BikeStationsRequestServiceProtocol = BikeStationsRequestService(),
			 bikeStationsStoreService: BikeStationsStoreServiceProtocol = BikeStationsStoreService()) {
		
		self.bikeStationsRequestService = bikeStationsRequestService
		self.bikeStationsStoreService = bikeStationsStoreService
	}
	
	func getBikeStations() async {
		
		do {
			
			let stations = try await bikeStationsRequestService.fetchBikeStations()
			
			try await bikeStationsStoreService.save(stations: stations)
			
			state = .successful
			
		} catch {
			
			hasError = true
			state = .unsuccessful
			
			switch error {
			case is NetworkError:
				self.error = .network(error: error as! NetworkError)
			case is DataParserError:
				self.error = .dataParsing(error: error as! DataParserError)
			default:
				self.error = .system(error: error)
			}
			
		}
		
	}
	
}

// MARK: - Error Handling

extension BikeStationsListViewModel {
	
	enum ErrorType: LocalizedError {
		case network(error: LocalizedError)
		case dataParsing(error: LocalizedError)
		case system(error: Error)
		
		var errorDescription: String? {
			
			switch self {
			case .network(error: let error),
					 .dataParsing(error: let error):
				
				return error.errorDescription
				
			case .system(error: let error):
				
				return error.localizedDescription
			}
		}
		
	}
	
}
