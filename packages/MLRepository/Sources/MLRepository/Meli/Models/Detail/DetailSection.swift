//
//  DetailSection.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct DetailSection: Codable {
    public let type:DetailSectionsTypes
    public let title:String?
    public let data : SectionData

    enum CodingKeys: String, CodingKey {
        case type
        case title
        case data = "model"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        type = try container.decode(DetailSectionsTypes.self, forKey: .type)
        title = try? container.decode(String.self, forKey: .title)
        switch type {
            case .warranty:
                data = try container.decode(DetailSectionsDataWarranty.self, forKey: .data)
                break
            case .description:
                data = try container.decode(DetailSectionsDataDescription.self, forKey: .data)
                break
            case .questions:
                data = try container.decode(DetailSectionsDataQuestions.self, forKey: .data)
                break
            case .text:
                data = try container.decode(DetailSectionsDataText.self, forKey: .data)
                break
        }
    }
    
    /// Encoder
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.title, forKey: .title)
        switch type {
            case .warranty:
                try container.encode(self.data as! DetailSectionsDataWarranty, forKey: .data)
                break
            case .description:
                try container.encode(self.data as! DetailSectionsDataDescription, forKey: .data)
                break
            case .questions:
                try container.encode(self.data as! DetailSectionsDataQuestions, forKey: .data)
                break
            case .text:
                try container.encode(self.data as! DetailSectionsDataText, forKey: .data)
                break
        }
    }
}
