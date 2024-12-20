//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
	
	var imageName: String
	var errorMessage: String
	
	var body: some View {
		VStack(spacing: 50) {
			
			Image(systemName: imageName)
				.resizable()
				.frame(width: 250, height: 220)
				.foregroundStyle(Color(.systemBlue))
			
			Text(errorMessage)
				.font(.headline)
				.multilineTextAlignment(.center)
			
		}
		.padding()
	}
}

#Preview {
	
	ErrorView(imageName: "exclamationmark.warninglight",
						errorMessage: "An unexpected error has happened, please try again later.")
		.environmentObject(LocationManager())
}
