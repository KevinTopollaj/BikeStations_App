//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

enum NetworkError: LocalizedError {
	
	case invalidURL
	case invalidServerResponse
	
	var errorDescription: String? {
		switch self {
		case .invalidURL:
			return "URL string is malformed."
		case .invalidServerResponse:
			return "The server returned an invalid response."
		}
	}
	
}
