//
//  SearchItem.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct SearchItem: Codable {
    public let id:String
    public let title:String
    public let pictures:SearchItemPictures
    public let price:SearchItemPrice
    public let installments:SearchItemInstallments?
    public let condition:SearchItemCondition
    public let colors_qty:Int?
    public let tags:[String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case pictures
        case price
        case installments
        case condition
        case colors_qty
        case tags
    }
    
    /// Decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        pictures = try container.decode(SearchItemPictures.self, forKey: .pictures)
        price = try container.decode(SearchItemPrice.self, forKey: .price)
        installments = try? container.decode(SearchItemInstallments.self, forKey: .installments)
        condition = (try? container.decode(SearchItemCondition.self, forKey: .condition)) ?? SearchItemCondition.unspecified
        colors_qty = try? container.decode(Int.self, forKey: .colors_qty)
        tags = try container.decode([String].self, forKey: .tags)
    }

    /// Encoder
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.pictures, forKey: .pictures)
        try container.encode(self.price, forKey: .price)
        try container.encode(self.installments, forKey: .installments)
        try container.encode(self.condition, forKey: .condition)
        try container.encode(self.colors_qty, forKey: .colors_qty)
        try container.encode(self.tags, forKey: .tags)
    }
    
}
