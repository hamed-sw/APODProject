//
//  Model.swift
//  APODProject
//
//  Created by Hamed Amiry on 16.09.2021.
//

import Foundation

struct APINetwork: Codable {
    let date: String
    let explanation: String
    var mediaType: String = "image"
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case date
        case explanation
        case mediaType = "media_type"
        case  url
    }
}
