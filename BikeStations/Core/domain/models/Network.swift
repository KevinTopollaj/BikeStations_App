//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

// MARK: - Network

struct Network: Codable {
	let id: String
	let name: String
	let location: Location
	let href: String
	let company: [String]
	let system: String
	let stations: [Station]
}
