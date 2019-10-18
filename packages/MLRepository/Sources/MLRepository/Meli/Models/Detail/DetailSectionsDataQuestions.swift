//
//  DetailSectionsDataQuestions.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct DetailSectionsDataQuestions:SectionData, Codable {
    public let questions:[DetailSectionsDataQuestion]
    public let total:Int

    enum CodingKeys: String, CodingKey {
        case questions
        case total
    }
}
