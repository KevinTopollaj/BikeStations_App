//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import CoreLocation
import Foundation
import CoreData


extension StationEntity {
	
	@nonobjc public class func fetchRequest() -> NSFetchRequest<StationEntity> {
		return NSFetchRequest<StationEntity>(entityName: "StationEntity")
	}
	
	@NSManaged public var id: String
	@NSManaged public var name: String
	@NSManaged public var latitude: Double
	@NSManaged public var longitude: Double
	@NSManaged public var timestamp: String
	@NSManaged public var freeBikes: Int64
	@NSManaged public var emptySlots: Int64
	
}

extension StationEntity : Identifiable {}
