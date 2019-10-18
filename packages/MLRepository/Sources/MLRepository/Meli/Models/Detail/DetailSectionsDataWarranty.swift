//
//  DetailSectionsDataWarranty.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct DetailSectionsDataWarranty:SectionData, Codable {
    public let sections:[DetailSectionsDataWarrantySection]
    public let showGradient:Bool

    enum CodingKeys: String, CodingKey {
        case sections
        case showGradient = "show_gradient"
    }
}
