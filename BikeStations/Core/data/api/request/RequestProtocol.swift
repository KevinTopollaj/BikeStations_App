//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

protocol RequestProtocol {
	
	var path: String { get }
	
	var headers: [String: String] { get }
	var params: [String: Any] { get }
	
	var urlParams: [String: String?] { get }
	
	var requestType: RequestType { get }
	
}

extension RequestProtocol {
	
	var host: String {
		APIConstants.host
	}
	
	var headers: [String: String] { [:] }
	
	var params: [String: Any] { [:] }
	
	var urlParams: [String: String?] { [:] }
	
	func createURLRequest() throws -> URLRequest {
		
		var urlBuilder = URLBuilder(host: host, path: path)
		
		if !urlParams.isEmpty {
			urlBuilder = urlBuilder.addQueryItems(urlParams)
		}
		
		let url = try urlBuilder.build()
		
		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = requestType.rawValue
		
		if !headers.isEmpty {
			urlRequest.allHTTPHeaderFields = headers
		}
		
		urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
		
		if !params.isEmpty {
			urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
		}
		
		return urlRequest
	}
	
}
