//
//  UseCase.home.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation
import MLRepository
import MLNetworking

// MARK: - Home
extension UseCase {
    public struct home {
        public static func get(completionHandler: @escaping (SearchResult?, URLResponse?, Error?) -> Void) {
            Networking.get(MeliRepository.home(), completionHandler: completionHandler)
        }
    }
}
