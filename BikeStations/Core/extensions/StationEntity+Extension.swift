//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

extension StationEntity {
	
	var mapURL: URL? {
		return try? URLBuilder
			.appleMapsURL(latitude: latitude, longitude: longitude)
			.build()
	}
	
}
