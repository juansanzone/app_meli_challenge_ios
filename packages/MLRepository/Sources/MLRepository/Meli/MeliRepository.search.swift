//
//  MeliRepository.search.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

extension MeliRepository {
    public class func search(_ query: String, timeout:TimeInterval = 100) -> URLRequest {
        var url = URLComponents(string: "\(MeliRepository.domine)/sites/\(MeliRepository.siteID)/search")
        url?.queryItems = [
            URLQueryItem(name: "q", value: query)
        ]
        
        var request = URLRequest(
            url: url!.url!,
            cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData,
            timeoutInterval: timeout
        )
        
        request.httpMethod = "GET"
        
        return request
    }
}
