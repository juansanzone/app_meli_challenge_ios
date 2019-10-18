//
//  MeliRepository.detail.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

extension MeliRepository {
    public class func detail(id:String, timeout:TimeInterval = 100) -> URLRequest {
        let url = URLComponents(string: "\(MeliRepository.domine)/vips/\(id)")

        var request = URLRequest(
            url: url!.url!,
            cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData,
            timeoutInterval: timeout
        )
        
        request.httpMethod = "GET"
        
        return request
    }
    
    public class func detailDescription(id:String, timeout:TimeInterval = 100) -> URLRequest {
        let url = URLComponents(string: "\(MeliRepository.domine)/vips/\(id)/description")

        var request = URLRequest(
            url: url!.url!,
            cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData,
            timeoutInterval: timeout
        )
        
        request.httpMethod = "GET"
        
        return request
    }
}
