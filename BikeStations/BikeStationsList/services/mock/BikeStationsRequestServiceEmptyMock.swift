//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

struct BikeStationsRequestServiceEmptyMock: BikeStationsRequestServiceProtocol {
	
	func fetchBikeStations() async -> [Station] {
		[]
	}
}
