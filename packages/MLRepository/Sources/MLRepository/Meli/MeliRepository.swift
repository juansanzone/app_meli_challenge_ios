//
//  File.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation

public class MeliRepository:MLRepository {
    static let domine = "https://frontend.mercadolibre.com"
    
    public enum SiteIDType:String {
        case MLA = "MLA"
        case MLC = "MLC"
    }
    
    public static var siteID:SiteIDType {
        get {
            return SiteIDType(rawValue: UserDefaults.standard.string(forKey: "repository.siteid")!)!
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "repository.siteid")
            UserDefaults.standard.synchronize()
        }
    }
}
