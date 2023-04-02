//
//  DashboardService.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import Foundation
import Combine

protocol DashboardServiceProtocol: AnyObject {
    
    var networker: NetworkerProtocol { get }
    
   // func fetchUser<T>(type: T.Type, params: Credentials) -> AnyPublisher<GeneralResponse<T>, Error> where T: Decodable
    
   // func fetchImage<T>(type: T.Type) -> AnyPublisher<GeneralResponse<T>, Error> where T: Decodable
    
}

final class DashboardService: DashboardServiceProtocol {
    
    let networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
//    func fetchImage<T>(type: T.Type) -> AnyPublisher<GeneralResponse<T>, Error> where T : Decodable {
//        <#code#>
//    }
    
//    func fetchUser<T>(type: T.Type, params: Credentials) -> AnyPublisher<GeneralResponse<T>, Error> where T : Decodable {
//
//        let endpoint = Endpoint.Dashboard
//
//        return networker.request(type: type,
//                                 url: endpoint.url,
//                                 headers: endpoint.headers,
//                                 parameters: params.dictionary,
//                                 method: .post)
//
//    }
    
}
