//
//  EndPoint+URL.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import Foundation

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "3.12.188.195"
        components.port = 8082
        components.path = "/api" + path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: Any] {
        return [
            "content-type": "application/json",
          //  "Authorization": "Bearer \(KeychainStorage.getAccessToken())"
        ]
    }
    
   static func getAPIKey(apiKey: String) -> String {
        return Bundle.main.infoDictionary?[apiKey] as? String ?? ""
    }
}

public enum HTTPMethod: String {
    case get = "get"
    case post = "post"
}
