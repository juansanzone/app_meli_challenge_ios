//
//  DetailSectionsDataWarrantySection.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct DetailSectionsDataWarrantySection: Codable {
    public let title:String
    public let subtitle:String
    
    enum CodingKeys: String, CodingKey {
        case title
        case subtitle
    }
}
