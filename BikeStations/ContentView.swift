//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//


import SwiftUI


struct ContentView: View {
	
	let managedObjectContext = PersistenceController.shared.container.viewContext
	@StateObject var locationManager = LocationManager()
	
	var body: some View {
		BikeStationsView()
			.environment(\.managedObjectContext, managedObjectContext)
			.environmentObject(locationManager)
	}
}

#Preview {
	
	ContentView()
	
}
