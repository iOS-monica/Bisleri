//
//  DashboardPhoto.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import Foundation

struct DashboardPhoto: Codable, Hashable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    
}

struct LimitDetails: Codable {
    var page: Int = 1
    var limit: Int = 10
}

