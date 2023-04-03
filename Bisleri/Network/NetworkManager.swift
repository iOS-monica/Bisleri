//
//  NetworkManager.swift
//  Bisleri
//
//  Created by Monica on 02/04/23.
//

import Foundation
import Combine

protocol NetworkerProtocol: AnyObject {
    
    typealias Headers = [String: Any]
    
    func getData<T>(type: T.Type,
                    url: URL,
                    headers: Headers) -> AnyPublisher<[T], Never> where T : Decodable
    
}

final class Networker: NetworkerProtocol {
    
    func getData<T>(type: T.Type,
                    url: URL,
                    headers: Headers) -> AnyPublisher<[T], Never> where T : Decodable {
        
        var urlRequest = URLRequest(url: url)
        
        headers.forEach { key, value in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map { $0.data }
            .decode(type: [T].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
        
    }
    
}
