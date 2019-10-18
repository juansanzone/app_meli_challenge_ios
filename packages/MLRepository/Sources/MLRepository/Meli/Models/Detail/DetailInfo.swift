//
//  DetailInfo.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct DetailInfo: Codable {
    public let id:String
    public let title:String
    public let description:String?
    public let subtitle:DetailSubtitle?
    public let pictures:[URL]
    public let price:DetailPrice
    public let shipping:DetailShipping?
    public let reviews:DetailReviews?
    public let protectedBuy:String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description = "main_attributes"
        case subtitle
        case pictures
        case price
        case shipping
        case reviews
        case protectedBuy = "protected_buy_info"
    }
}
