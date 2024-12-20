//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import SwiftUI
import CoreLocationUI

struct RequestLocationView: View {
	
	@EnvironmentObject var locationManager: LocationManager
	
	var imageName: String
	var descriptionText: String
	
	var body: some View {
		
		VStack(spacing: 50) {
			
			Image(systemName: imageName)
				.resizable()
				.frame(width: 220, height: 220)
				.foregroundStyle(Color(.systemBlue))
			
			Text(descriptionText)
				.multilineTextAlignment(.center)
			
			LocationButton {
				locationManager.requestWhenInUseAuthorization()
			}
			.symbolVariant(.fill)
			.foregroundStyle(.white)
			.clipShape(RoundedRectangle(cornerRadius: 8))
		}
		.padding()
		.onAppear {
			locationManager.updateAuthorizationStatus()
		}
		
	}
}

#Preview {
	RequestLocationView(imageName: "bicycle.circle", descriptionText: "To find bike stations near you, you need to share your current location.")
		.environmentObject(LocationManager())
}
