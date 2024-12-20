//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

extension URLBuilder {
	
	static func appleMapsURL(latitude: Double, longitude: Double) -> URLBuilder {
		return URLBuilder(host: "maps.apple.com")
						.addQueryItem(name: "ll", value: "\(latitude),\(longitude)")
	}
	
}
