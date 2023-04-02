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
    
    func request<T>(type: T.Type,
                    url: URL,
                    headers: Headers,
                    parameters: [String: Any]?,
                    method: HTTPMethod) -> AnyPublisher<GeneralResponse<T>, Error> where T: Decodable
    
    func getData(url: URL,
                 headers: Headers) -> AnyPublisher<Data, URLError>
}

final class Networker: NetworkerProtocol {
    
    func request<T>(type: T.Type,
                    url: URL,
                    headers: Headers,
                    parameters: [String: Any]? = nil,
                    method: HTTPMethod) -> AnyPublisher<GeneralResponse<T>, Error> where T : Decodable {
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        if let dataDictionary = parameters {
            do {
                let requestBody = try JSONSerialization.data(withJSONObject: dataDictionary,
                                                             options: .prettyPrinted)
                urlRequest.httpBody = requestBody
            } catch let error {
                debugPrint(error.localizedDescription)
            }
        }
        
        headers.forEach { key, value in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: GeneralResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func getData(url: URL,
                 headers: Headers) -> AnyPublisher<Data, URLError> {
        
        var urlRequest = URLRequest(url: url)
        
        headers.forEach { key, value in
            if let value = value as? String {
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
