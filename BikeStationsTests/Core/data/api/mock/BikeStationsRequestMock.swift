//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

@testable import BikeStations

enum BikeStationsRequestMock: RequestProtocol {
	
	case getBikeStations
	
	var path: String {
		guard let path = Bundle.main.path(forResource: "BikeMap", ofType: "json") else { return "" }
		
		return path
	}
	
	var requestType: RequestType {
		.GET
	}
	
	
}
