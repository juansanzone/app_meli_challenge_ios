//
//  TableViewCellProtocol.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation
import UIKit

// MARK: - Custom UITableViewCell Protocol
public protocol TableViewCellProtocol: class, ReusableViewCellsProtocol {
    
    /// Estimated height of the cell at static level.
    /// You want to provide a value for this variable only if your cell doesn't have height based
    /// upon the content.
    static var estimatedHeight: CGFloat? { get }
    
    /// Estimated height of the cell at static level.
    /// You want to provide a value for this variable only if your cell doesn't have height based
    /// upon the content (you may, however, return `UITableViewAutomaticDimension` if needed)
    static var defaultHeight: CGFloat? { get }
}

///ArtearUITableViewCellProtocol extension to implement default content
public extension TableViewCellProtocol where Self: UITableViewCell {
    
    /// By default reuseIdentifier uses the name of the class you have used
    /// to declare this cell. This simple rule avoid confusion with naming and produce
    /// consistent results across your code.
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    /// Estimated height of the cell, if applicable
    static var estimatedHeight: CGFloat? {
        return nil
    }
    
    /// Default height of the cell, if applicable
    static var defaultHeight: CGFloat? {
        return nil
    }
    
    /// Default height of the cell, if applicable
    static var shouldHightlight: Bool? {
        return nil
    }
    
    ///Equatable Implementation
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}
