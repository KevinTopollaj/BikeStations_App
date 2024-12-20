//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

enum BikeStationsRequest: RequestProtocol {
	
	case getBikeStations
	
	var path: String {
		switch self {
		case .getBikeStations:
			return "/v2/networks/wienmobil-rad"
		}
	}
	
	var requestType: RequestType {
		
		switch self {
		case .getBikeStations:
				.GET
		}
	}
	
}
