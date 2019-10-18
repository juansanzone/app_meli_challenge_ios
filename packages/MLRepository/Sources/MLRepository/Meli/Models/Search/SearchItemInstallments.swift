//
//  SearchItemInstallments.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct SearchItemInstallments: Codable {
    public let quantity:Int
    public let text:String?

    enum CodingKeys: String, CodingKey {
        case quantity
        case text
    }
}
