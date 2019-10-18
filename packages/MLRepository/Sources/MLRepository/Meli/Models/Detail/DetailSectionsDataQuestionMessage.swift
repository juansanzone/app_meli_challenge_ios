//
//  DetailSectionsDataQuestionMessage.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct DetailSectionsDataQuestionMessage:Codable {
    public let text:String

    enum CodingKeys: String, CodingKey {
        case text
    }
}
