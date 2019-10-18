//
//  Detail.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct Detail: Codable {
    public let info:DetailInfo?
    public let sections:[DetailSection]
    
    enum CodingKeys: String, CodingKey {
        case info = "main_info"
        case sections
    }
    
    /// Decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        info = try? container.decode(DetailInfo.self, forKey: .info)
        sections = try container.decodeArrayTolerance(DetailSection.self, forKey: .sections, min: 0)
    }

    /// Encoder
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.info, forKey: .info)
        try container.encode(self.sections, forKey: .sections)
    }
}
