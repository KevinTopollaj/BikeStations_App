//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import CoreData
import XCTest

@testable import BikeStations

final class CoreDataTests: XCTestCase {
	
	func testStationsFetchRequest() throws {
		
		let previewContext = PersistenceController.preview.container.viewContext
		
		let fetchRequest = StationEntity.fetchRequest()
		
		guard let results = try? previewContext.fetch(fetchRequest) else {
			return
		}
		
		XCTAssertEqual(results.count, 2)
		
	}
	
}
