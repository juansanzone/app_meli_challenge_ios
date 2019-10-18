//
//  SearchResult.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation
import MLTools

public struct SearchResult: Codable {
    public let query: String
    public let items: [SearchItem]
    
    enum CodingKeys: String, CodingKey {
        case query = "query"
        case items = "results"
    }
    
    /// Decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        query = try container.decode(String.self, forKey: .query)
        items = try container.decodeArrayTolerance(SearchItem.self, forKey: .items, min: 1)
    }

    /// Encoder
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.query, forKey: .query)
        try container.encode(self.items, forKey: .items)
    }
}
