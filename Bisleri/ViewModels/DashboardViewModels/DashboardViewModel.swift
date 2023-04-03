//
//  DashboardViewModel.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import Combine
import UIKit

final class DashboardViewModel: ObservableObject {
    
    private var dashboardService: DashboardServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    @Published var uploadDetails: [DashboardPhoto]
    @Published var showProgressView: Bool = false
    
    init(dashboardService: DashboardServiceProtocol = DashboardService(),
         uploadDetails: [DashboardPhoto] = [DashboardPhoto]()) {
        self.dashboardService = dashboardService
        self.uploadDetails = uploadDetails
    }
    
    
    
    public func getUploadDetails() {
        
        let limitDetails = LimitDetails(page: 1, limit: 20)
        
        dashboardService.fetchImage(type: DashboardPhoto.self, params: limitDetails)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                self?.showProgressView = false
                switch completion {
                case .failure(let error):
                    print("Failure")
                case .finished:
                    break
                }
            } receiveValue: { [weak self] response in
                self?.showProgressView = false
                print("Responsee", response)
            }
            .store(in: &cancellables)
        
    }
    
    
}
