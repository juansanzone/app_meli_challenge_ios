//
//  DetailPrice.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct DetailPrice: Codable {
    public let price:Float
    public let priceOriginal:Float?
    public let currencyID:String
    public let rate:Int?

    enum CodingKeys: String, CodingKey {
        case price = "amount"
        case priceOriginal = "original_price"
        case currencyID = "currency_id"
        case rate = "discount_rate"
    }
}
