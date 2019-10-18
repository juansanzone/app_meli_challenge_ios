//
//  UseCase.detail.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation
import MLRepository
import MLNetworking

// MARK: - Detail
extension UseCase {
    public struct detail {
        public static func get(id:String, completionHandler: @escaping (Detail?, URLResponse?, Error?) -> Void) {
            Networking.get(MeliRepository.detail(id: id), completionHandler: completionHandler)
        }
        
        public static func getDescription(id:String, completionHandler: @escaping (Detail?, URLResponse?, Error?) -> Void) {
            Networking.get(MeliRepository.detailDescription(id: id), completionHandler: completionHandler)
        }
    }
}
