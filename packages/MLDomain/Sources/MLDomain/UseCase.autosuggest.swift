//
//  UseCase.autosuggest.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation
import MLRepository
import MLNetworking

// MARK: - Autosuggest
extension UseCase {
    public struct autosuggest {
        public static func get(query:String, completionHandler: @escaping (Suggesteds?, URLResponse?, Error?) -> Void) {
            Networking.get(MeliRepository.autosuggest(query), completionHandler: completionHandler)
        }
    }
}
