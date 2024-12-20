//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

protocol APIManagerProtocol {
	
	func perform(_ request: RequestProtocol) async throws -> Data
}

class APIManager: APIManagerProtocol {
	
	private let urlSession: URLSession
	
	init(urlSession: URLSession = .shared) {
		self.urlSession = urlSession
	}
	
	func perform(_ request: any RequestProtocol) async throws -> Data {
		
		let (data, response) = try await urlSession.data(for: request.createURLRequest())
		
		guard let httpResponse = response as? HTTPURLResponse,
					(200...300) ~= httpResponse.statusCode else {
			
			throw NetworkError.invalidServerResponse
		}
		
		return data
	}
	
}
