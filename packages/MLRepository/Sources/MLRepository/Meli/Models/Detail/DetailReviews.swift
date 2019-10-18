//
//  DetailReviews.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct DetailReviews: Codable {
    public let description:String

    enum CodingKeys: String, CodingKey {
        case description = "label"
    }
}
