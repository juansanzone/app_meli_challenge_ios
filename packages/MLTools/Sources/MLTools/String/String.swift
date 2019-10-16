//
//  String.swift
//  
//
//  Created by Jose Luis Sagredo on 15/10/2019.
//

import Foundation

public extension String {
    func removeHTML() -> String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}

public extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
