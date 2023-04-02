//
//  NetworkError.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString(StringConstant.invalidURL, comment: StringConstant.invalidURL)
        case .responseError:
            return NSLocalizedString(StringConstant.unexpectedStatusCode, comment: StringConstant.invalidResponse)
        case .unknown:
            return NSLocalizedString(StringConstant.unknownError, comment: StringConstant.unknownError)
        }
    }
}
