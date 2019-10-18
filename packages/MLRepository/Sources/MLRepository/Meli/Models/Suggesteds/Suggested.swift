//
//  Suggested.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct Suggested: Codable {
    public let query: String
    
    enum CodingKeys: String, CodingKey {
        case query = "q"
    }
}
