//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

// MARK: - Station

struct Station: Codable {
	
	let id: String
	let name: String
	let latitude: Double
	let longitude: Double
	let timestamp: String
	let freeBikes: Int
	let emptySlots: Int?
//	let extra: Extra
	
	enum CodingKeys: String, CodingKey {
		case id, name, latitude, longitude, timestamp
		case freeBikes = "free_bikes"
		case emptySlots = "empty_slots"
//		case extra
	}
}
