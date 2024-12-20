//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

struct BikeStationsRequestServiceMock: BikeStationsRequestServiceProtocol {
	
	func fetchBikeStations() async -> [Station] {
		Station.mockStations
	}
}
