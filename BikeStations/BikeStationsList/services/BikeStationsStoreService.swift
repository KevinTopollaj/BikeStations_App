//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import CoreData

protocol BikeStationsStoreServiceProtocol {
	
	func save(stations: [Station]) async throws
}

struct BikeStationsStoreService {
	
	private let context: NSManagedObjectContext
	
	init(context: NSManagedObjectContext = PersistenceController.shared.container.newBackgroundContext()) {
		self.context = context
	}
	
}

extension BikeStationsStoreService: BikeStationsStoreServiceProtocol {
	
	func save(stations: [Station]) async throws {
		
		for var station in stations {
			station.toManagedObject(context: context)
		}
		
		try context.save()
		
	}
	
}
