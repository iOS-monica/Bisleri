//
//  EndPoint+Dashboard.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import Foundation

extension Endpoint {
    
    static var dashboard: Self {
        
        let queryItems = [URLQueryItem(name: "_page", value: "1"), URLQueryItem(name: "_limit", value: "20")]
        
        return Endpoint(path: "/photos", queryItems: queryItems)
    }
   
}
