//
//  SearchItemPicture.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct SearchItemPicture: Codable {
    public let normal:URL
    public let retina:URL

    enum CodingKeys: String, CodingKey {
        case normal
        case retina
    }
}
