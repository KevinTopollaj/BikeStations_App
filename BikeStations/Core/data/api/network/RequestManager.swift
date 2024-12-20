//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

protocol RequestManagerProtocol {
	
	func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}

class RequestManager: RequestManagerProtocol {
	
	let apiManager: APIManagerProtocol
	let parser: DataParserProtocol
	
	init(apiManager: APIManagerProtocol = APIManager(),
			 parser: DataParserProtocol = DataParser()) {
		
		self.apiManager = apiManager
		self.parser = parser
	}
	
	func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T {
	
		let data = try await apiManager.perform(request)
		let decodedObject: T = try parser.parse(data: data)
		
		return decodedObject
	}
	
}
