//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

protocol DataParserProtocol {
	
	func parse<T: Decodable>(data: Data) throws -> T
}

class DataParser: DataParserProtocol {
	
	private var jsonDecoder: JSONDecoder
	
	init(jsonDecoder: JSONDecoder = JSONDecoder()) {
		self.jsonDecoder = jsonDecoder
	}
	
	func parse<T: Decodable>(data: Data) throws -> T {
		
		guard let type = try? jsonDecoder.decode(T.self, from: data) else {
			throw DataParserError.invalidDataParsing
		}
		
		return type
	}
	
}
