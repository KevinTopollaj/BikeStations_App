//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

private struct StationsMock: Codable {
	let stations: [Station]
}

private func loadMockStations() -> [Station] {
	
	guard let url = Bundle.main.url(forResource: "BikeMap", withExtension: "json"),
				let data = try? Data(contentsOf: url) else { return [] }
	
	let decoder = JSONDecoder()
	let bikeMap = try? decoder.decode(BikeMap.self, from: data)
	
	return bikeMap?.network.stations ?? []
}

extension Station {
	static let mockStations = loadMockStations()
}
