//
//  SearchItemPictures.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public struct SearchItemPictures: Codable {
    public let stack:SearchItemPicture
    public let grid:SearchItemPicture
    public let mosaic:SearchItemPicture

    enum CodingKeys: String, CodingKey {
        case stack
        case grid
        case mosaic
    }
}
