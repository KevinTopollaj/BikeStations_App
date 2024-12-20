//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import SwiftUI

struct BikeStationDetailCardView: View {
	
	let title: String
	let value: String
	let color: Color
	
	var body: some View {
		
		VStack {
			Text(title)
				.font(.caption)
			
			Text(value)
				.font(.caption.weight(.semibold))
		}
		.padding(6)
		.background(color.opacity(0.2))
		.foregroundStyle(color)
		.clipShape(RoundedRectangle(cornerRadius: 10))
		
	}
	
}

#Preview {
	
	HStack {
		BikeStationDetailCardView(title: "Free Bikes", 
															value: "3",
															color: Color(.systemGreen))
		
		BikeStationDetailCardView(title: "Empty Slots",
															value: "6",
															color: Color(.systemBlue))
	}
	
}
