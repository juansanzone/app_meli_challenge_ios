//
//  DetailShipping.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct DetailShipping: Codable {
    public let icon:String
    public let description:String

    enum CodingKeys: String, CodingKey {
        case icon
        case description = "additional_info"
    }
}
