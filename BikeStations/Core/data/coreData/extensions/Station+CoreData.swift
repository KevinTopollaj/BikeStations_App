//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import CoreData

extension Station {
	
	init(managedObject: StationEntity) {
		self.id = managedObject.id
		self.name = managedObject.name
		self.latitude = managedObject.latitude
		self.longitude = managedObject.longitude
		self.timestamp = managedObject.timestamp
		self.freeBikes = Int(managedObject.freeBikes)
		self.emptySlots = Int(managedObject.emptySlots)
	}
	
	private func checkForExistingStation(id: String, context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) -> Bool {
		
		let fetchRequest = StationEntity.fetchRequest()
		fetchRequest.predicate = NSPredicate(format: "id = %@", id)

		if let results = try? context.fetch(fetchRequest), results.first != nil {
			return true
		}
		return false
	}
	
	mutating func toManagedObject(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
		
		guard checkForExistingStation(id: self.id, context: context) == false else { return }
		
		let persistedValue = StationEntity.init(context: context)
		persistedValue.id = self.id
		persistedValue.name = self.name
		persistedValue.latitude = self.latitude
		persistedValue.longitude = self.longitude
		persistedValue.timestamp = self.timestamp
		persistedValue.freeBikes = Int64(self.freeBikes)
		persistedValue.emptySlots = Int64(self.emptySlots ?? -1)
	}
	
}
