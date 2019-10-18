//
//  DetailSectionsDataText.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct DetailSectionsDataText:SectionData, Codable {
    public let text:String

    enum CodingKeys: String, CodingKey {
        case text = "content"
    }
}
