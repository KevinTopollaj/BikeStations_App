//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

protocol BikeStationsRequestServiceProtocol {
	
	func fetchBikeStations() async throws -> [Station]
}

struct BikeStationsRequestService {
	
	private let requestManager: RequestManagerProtocol
	
	init(requestManager: RequestManagerProtocol = RequestManager()) {
		self.requestManager = requestManager
	}
	
}

extension BikeStationsRequestService: BikeStationsRequestServiceProtocol {
	
	func fetchBikeStations() async throws -> [Station] {
		
		let requestData = BikeStationsRequest.getBikeStations
		
		let bikeMap: BikeMap = try await requestManager.perform(requestData)
		return bikeMap.network.stations
		
	}
	
}
