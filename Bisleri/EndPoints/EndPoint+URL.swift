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
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = path
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
