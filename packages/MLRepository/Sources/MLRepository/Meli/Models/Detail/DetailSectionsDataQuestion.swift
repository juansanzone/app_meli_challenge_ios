//
//  DetailSectionsDataQuestion.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct DetailSectionsDataQuestion:Codable {
    public let id:Int
    public let display:String
    public let question:DetailSectionsDataQuestionMessage
    public let answer:DetailSectionsDataQuestionMessage

    enum CodingKeys: String, CodingKey {
        case id
        case display
        case question
        case answer
    }
}
