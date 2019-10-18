//
//  ElementProtocol.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation
import UIKit

///Protocol should be implemented by items & rows
public protocol ElementProtocol {
    ///Define a closure
    typealias RowReference = ((ElementProtocol) -> (Void))
    /// PRIVATE
    
    /// This is for internal purpose only.
    /// Return the valid value of associated `DeclarativeCell`'s `shouldHighlight`.
    var _shouldHighlight: Bool? { get }
    
    /// Private use only.
    var _indexPath:         IndexPath? { get set }
    
    /// PUBLIC
    
    /// Optional unique identifier for this row
    var identifier:            String? { get set }
    
    /// When associated cell is dequeued this value contains the associated
    /// indexPath value.
    var indexPath:            IndexPath? { get }
    
    /// Reuse identifier of the cell
    var reuseIdentifier:    String { get }
    
    /// Type of cell which represent the row
    var cellType:            AnyClass { get }
    
    /// Define is should be highlight
    var shouldHighlight: Bool? { get set }
    
    
    /// hash value of the row
    var hashValue: Int { get }
}
