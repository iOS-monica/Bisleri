//
//  NetworkMonitor.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import SwiftUI
import Network

// An enum to handle the network status
enum NetworkStatus: String {
    case connected
    case disconnected
}

class Monitor: ObservableObject {
    
    static var shared = Monitor()
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Monitor")
    
    @Published var status: NetworkStatus = .disconnected
    
    /// Check network connectivity with alert
    /// - Returns: connectivity status
    func checkNetworkAvailability() -> Bool {
        if status == .disconnected {
            NotificationCenter.default.post(name: NotificationCenterName.key, object: nil)
        }
        return networkAvailability()
    }
    
    /// Check network connectivity without alert
    /// - Returns: connectivity status
    func networkAvailability() -> Bool {
      return  status == .connected ? true : false
    }
    
    private init() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            
            // Monitor runs on a background thread so we need to publish
            // on the main thread
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    self.status = .connected
                } else {
                    self.status = .disconnected
                }
            }
        }
        monitor.start(queue: queue)
    }
}
