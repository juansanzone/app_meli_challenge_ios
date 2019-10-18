//
//  UseCase.search.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation
import MLRepository
import MLNetworking

// MARK: - Search
extension UseCase {
    public struct search {
        public static func get(query:String, completionHandler: @escaping (SearchResult?, URLResponse?, Error?) -> Void) {
            Networking.get(MeliRepository.search(query), completionHandler: completionHandler)
        }
    }
}
