//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

struct URLBuilder {
	
	private var scheme: String = "https"
	private var host: String
	private var path: String
	private var queryItems: [URLQueryItem] = []
	
	init(host: String, path: String = "") {
		self.host = host
		self.path = path
	}
	
	func setScheme(_ scheme: String) -> URLBuilder {
		var builder = self
		builder.scheme = scheme
		return builder
	}
	
	func setPath(_ path: String) -> URLBuilder {
		var builder = self
		builder.path = path
		return builder
	}
	
	func addQueryItem(name: String, value: String?) -> URLBuilder {
		var builder = self
		let item = URLQueryItem(name: name, value: value)
		builder.queryItems.append(item)
		return builder
	}
	
	func addQueryItems(_ items: [String: String?]) -> URLBuilder {
		var builder = self
		builder.queryItems.append(contentsOf: items.map { URLQueryItem(name: $0.key, value: $0.value) })
		return builder
	}
	
	func build() throws -> URL {
		var components = URLComponents()
		components.scheme = scheme
		components.host = host
		components.path = path
		components.queryItems = queryItems
		
		guard let url = components.url else {
			throw NetworkError.invalidURL
		}
		return url
	}
}
