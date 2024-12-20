//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import SwiftUI

struct BikeStationsView: View {
	
	@EnvironmentObject var locationManager: LocationManager
	
	var body: some View {
		
		NavigationStack {
			
			if locationManager.locationIsDisabled {
				
				RequestLocationView(imageName: "bicycle.circle", descriptionText: "To find bike stations near you, you need to share your current location.")
				
			} else {
				
				BikeStationsListView()
				
			}
		}

	}
}

#Preview {
	BikeStationsView()
		.environmentObject(LocationManager())
}
