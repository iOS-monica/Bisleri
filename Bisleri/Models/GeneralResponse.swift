//
//  GeneralResponse.swift
//  Bisleri
//
//  Created by SOFTSUAVE on 02/04/23.
//

import Foundation

struct GeneralResponse<T: Codable>: Codable {
    var status: String?
    var data: T?
    var message: String?
}
