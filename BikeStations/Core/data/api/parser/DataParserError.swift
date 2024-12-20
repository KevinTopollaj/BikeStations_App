//
//  Copyright © 2024 Kevin Topollaj. All rights reserved.
//

import Foundation

enum DataParserError: LocalizedError {
	
	case invalidDataParsing
	
	var errorDescription: String? {
		
		switch self {
		case .invalidDataParsing:
			return "Parsing data failed"
		}
	}
	
}
