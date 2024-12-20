//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import CoreData

enum CoreDataHelper {
	
	static let context = PersistenceController.shared.container.viewContext
	static let previewContext = PersistenceController.preview.container.viewContext
	
}

// MARK: - Xcode Previews Content

extension CoreDataHelper {
	
	static func getTestStation() -> Station? {
		let fetchRequest = StationEntity.fetchRequest()
		
		if let results = try? previewContext.fetch(fetchRequest),
			 let first = results.first {
			return Station(managedObject: first)
		}
		
		return nil
	}

	static func getTestStations() -> [Station]? {
		let fetchRequest = StationEntity.fetchRequest()

		if let results = try? previewContext.fetch(fetchRequest), !results.isEmpty {
			return results.map(Station.init(managedObject:))
		}
		
		return nil
	}
	
	static func getTestStationEntity() -> StationEntity? {
		let fetchRequest = StationEntity.fetchRequest()
		fetchRequest.fetchLimit = 1
		
		guard let results = try? previewContext.fetch(fetchRequest),
					let first = results.first else { return nil }
		
		return first
	}

	static func getTestStationEntities() -> [StationEntity]? {
		let fetchRequest = StationEntity.fetchRequest()
		
		guard let results = try? previewContext.fetch(fetchRequest),
					!results.isEmpty else { return nil }
		
		return results
	}
	
}
