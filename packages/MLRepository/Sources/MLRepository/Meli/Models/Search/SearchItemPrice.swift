//
//  SearchItemPrice.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct SearchItemPrice: Codable {
    public let amount:Float
    public let currency_id:String
    public let discount_rate:Int

    enum CodingKeys: String, CodingKey {
        case amount
        case currency_id
        case discount_rate
    }
}
