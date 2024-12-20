//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation
import XCTest

@testable import BikeStations

class RequestManagerTests: XCTestCase {
	
	private var requestManager: RequestManagerProtocol?
	
	override func setUp() {
		super.setUp()
		
		requestManager = RequestManager(apiManager: APIManagerMock())
		
	}
	
	func testFetchBikeStations() async throws {
		
		guard let bikeMap: BikeMap = try await requestManager?.perform(BikeStationsRequestMock.getBikeStations) else {
			XCTFail("Didn't get data from the request manager")
			return
		}
		
		let stations = bikeMap.network.stations
		
		let first = stations.first
		let last = stations.last
		
		XCTAssertEqual(first?.name, "Georg-Ehrlich-Weg")
		XCTAssertEqual(first?.freeBikes, 8)
		XCTAssertEqual(first?.emptySlots, nil)
		
		XCTAssertEqual(last?.name, "Mittersteig")
		XCTAssertEqual(last?.freeBikes, 15)
		XCTAssertEqual(last?.emptySlots, 8)
	}
	
}
