//
//  MeliRepository.autosuggest.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

extension MeliRepository {
    public class func autosuggest(_ query: String, timeout:TimeInterval = 100) -> URLRequest {
        var url = URLComponents(string: "https://suggestgz.mlapps.com/sites/\(MeliRepository.siteID)/autosuggest")
        url?.queryItems = [
            URLQueryItem(name: "api_version",value: "2"),
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
