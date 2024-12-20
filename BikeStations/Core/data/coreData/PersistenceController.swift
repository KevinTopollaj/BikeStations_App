//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import CoreData

struct PersistenceController {
	
	static let shared = PersistenceController()
	
	static var preview: PersistenceController = {
		
		let result = PersistenceController(inMemory: true)
		
		let viewContext = result.container.viewContext
		
		for i in 0...1 {
			var station = Station.mockStations[i]
			station.toManagedObject(context: viewContext)
		}
		
		do {
			try viewContext.save()
		} catch {
			let nsError = error as NSError
			fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
		}
		return result
	}()
	
	let container: NSPersistentContainer
	
	init(inMemory: Bool = false) {
		
		container = NSPersistentContainer(name: "BikeStations")
		
		if inMemory {
			container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
		}
		
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
		
		container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
		container.viewContext.automaticallyMergesChangesFromParent = true
	}
	
}

