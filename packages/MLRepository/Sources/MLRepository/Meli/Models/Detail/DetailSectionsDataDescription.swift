//
//  DetailSectionsDataDescription.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct DetailSectionsDataDescription:SectionData, Codable {
    public let description:String

    enum CodingKeys: String, CodingKey {
        case description = "content"
    }
}
