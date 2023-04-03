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
    
    func fetchImage<T>(type: T.Type) -> AnyPublisher<[T], Never> where T: Decodable
    
}

final class DashboardService: DashboardServiceProtocol {
    
    let networker: NetworkerProtocol
    
    init(networker: NetworkerProtocol = Networker()) {
        self.networker = networker
    }
    
    func fetchImage<T>(type: T.Type) -> AnyPublisher<[T], Never> where T: Decodable {
        
        let endpoint = Endpoint.dashboard
        
        return networker.getData(type: type, url: endpoint.url, headers: endpoint.headers)
        
    }
    
}
