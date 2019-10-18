//
//  ReusableViewCellsProtocol.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation
import UIKit

///Protocol for reusable cells (Decoration & Supplementary)
public protocol ReusableViewCellsProtocol {
    
    ///Type for elements model
    associatedtype T
    
    /// Identifier of the cell. Default implementation has the same name of the class itself.
    static var reuseIdentifier: String { get }
    
    /// If you want to disable highlight of the row without doing any conditions check you
    /// can set this value directly as cell property.
    /// It will override any `onShouldHighlight` event of the `RowProtocol`.
    static var shouldHightlight: Bool? { get }
    
    /// Configure a cell instance just after the dequeue from table instance
    ///
    /// - Parameters:
    ///   - _: item to render
    ///   - path: index path
    func configure(_: T, path: IndexPath)
    
    
    /// Will display a cell instance from table instance
    ///
    /// - Parameters:
    ///   - _: item to render
    ///   - path: index path
    func willDisplay(_: T, path: IndexPath)
    
    /// End display a cell instance from table instance
    ///
    /// - Parameters:
    ///   - _: item to render
    ///   - path: index path
    func endDisplay(_: T, path: IndexPath)
}
