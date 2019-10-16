//
//  Float.swift
//  
//
//  Created by Jose Luis Sagredo on 15/10/2019.
//

import Foundation

public extension Float {
    func separatorString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = "."

        return formatter.string(for: self) ?? "\(self)"
    }
}
