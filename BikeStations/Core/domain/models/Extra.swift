//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

// MARK: - Extra

struct Extra: Codable {
	let uid: String
	let number: String
	let bikeUids: [String]
	let slots: Int?
	
	enum CodingKeys: String, CodingKey {
		case uid, number
		case bikeUids = "bike_uids"
		case slots
	}
	
}
