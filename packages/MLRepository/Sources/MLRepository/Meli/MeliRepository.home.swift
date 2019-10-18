//
//  MeliRepository.home.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

extension MeliRepository {
    public class func home(timeout:TimeInterval = 100) -> URLRequest {
        let url = URLComponents(string: "\(MeliRepository.domine)/sites/\(MeliRepository.siteID)/home")

        var request = URLRequest(
            url: url!.url!,
            cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData,
            timeoutInterval: timeout
        )
        
        request.httpMethod = "GET"
        
        return request
    }
}

