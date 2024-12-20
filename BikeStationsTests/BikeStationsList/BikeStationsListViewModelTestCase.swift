//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import XCTest

@testable import BikeStations

@MainActor
final class BikeStationsListViewModelTestCase: XCTestCase {
	
	let testContext = PersistenceController.preview.container.viewContext
	var viewModel: BikeStationsListViewModel!
	
	func testGetBikeStationsState() async {
		
		viewModel = BikeStationsListViewModel(bikeStationsRequestService: BikeStationsRequestServiceMock(), bikeStationsStoreService: BikeStationsStoreService(context: testContext))
		
		XCTAssertEqual(viewModel.state, .loading)
		
		await viewModel.getBikeStations()
		
		XCTAssertEqual(viewModel.state, .successful)
		
	}
	
	func testGetBikeStationsEmptyResponse() async {
		
		viewModel = BikeStationsListViewModel(bikeStationsRequestService: BikeStationsRequestServiceEmptyMock(), bikeStationsStoreService: BikeStationsStoreService(context: testContext))
		
		await viewModel.getBikeStations()
		
		XCTAssertEqual(viewModel.state, .successful)
		XCTAssertFalse(viewModel.hasError)
		
	}
	
}
