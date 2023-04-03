//
//  DashboardPhoto.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import Foundation

struct DashboardPhoto: Codable {
   
    var albumId: Int?
    var id: Int?
    var title: String?
    var url: String?
    var thumbnailUrl: Int?
    
}

struct LimitDetails: Codable {
    var page: Int = 1
    var limit: Int = 10
}

