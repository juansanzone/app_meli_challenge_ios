//
//  Suggesteds.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct Suggesteds: Codable {
    public let query: String
    public let queries: [Suggested]?
    
    enum CodingKeys: String, CodingKey {
        case query = "q"
        case queries = "suggested_queries"
    }
}
