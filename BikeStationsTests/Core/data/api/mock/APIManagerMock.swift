//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

@testable import BikeStations

struct APIManagerMock: APIManagerProtocol {
	
	func perform(_ request: RequestProtocol) async throws -> Data {
		return try Data(contentsOf: URL(fileURLWithPath: request.path), 
										options: .mappedIfSafe)
	}
	
}
