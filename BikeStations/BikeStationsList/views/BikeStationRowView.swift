//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import SwiftUI

struct BikeStationRowView: View {
	
	let stationEntity: StationEntity
	
	var body: some View {
		
		HStack(spacing: 10) {
			
			Image(systemName: "bicycle.circle")
				.resizable()
				.frame(width: 80, height: 80)
				.foregroundStyle(Color(.systemBlue))
			
			VStack(alignment: .leading) {
				
				Text(stationEntity.name)
					.font(.title3)
					.lineLimit(2)
				
				HStack(spacing: 8) {
					
					BikeStationDetailCardView(title: "Free Bikes",
																		value: String(stationEntity.freeBikes),
																		color: Color(.systemGreen))
					
					if Int(stationEntity.emptySlots) != -1 {
						BikeStationDetailCardView(title: "Empty Slots",
																			value: String(stationEntity.emptySlots),
																			color: Color(.systemBlue))
					}
					
				}
					
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			
			if stationEntity.mapURL != nil {
				Image(systemName: "chevron.right")
					.font(.headline)
			}
			
		}
		
	}
	
}

#Preview {
	
	BikeStationRowView(stationEntity: CoreDataHelper.getTestStationEntity()!)
		.environmentObject(LocationManager())
		.environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
	
}
