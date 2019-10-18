//
//  RowProtocol.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation
import UIKit

///Row specific protocol add more specifications for ArtearElementProtocol
public protocol RowProtocol : ElementProtocol {
    
    /// Instance of the represented cell for this row (set only if row is visible, maybe `nil`)
    var _instance:            UITableViewCell? { get }
    
    /// This is for internal purpose only.
    /// Return the valid value of associated `DeclarativeCell`'s `estimatedHeight`.
    var _estimatedHeight: CGFloat? { get }
    
    /// This is for internal purpose only.
    /// Return the valid value of associated `DeclarativeCell`'s `defaultHeight`.
    var _defaultHeight: CGFloat? { get }
    
    /// Allows the user to perform an estimation of the height of the cell.
    /// This is done at runtime level when a single instance of the Row is about to be displayed.
    /// You can return a fixed height or `UITableViewAutomaticDimension`.
    /// If you return `nil` the result of the method is ignored and the request is made statically
    /// to the `estimatedHeight` of the provided cell class.
    /// If, even this method, return `nil` `TableManager` attempt to evaluate the height of the cell
    /// by creating it and getting the size of the `contentView`.
    var evaluateEstimatedHeight: (() -> (CGFloat?))? { get set }
    
    /// Allows the user to return the height of the cell.
    /// This is done at runtime level when a single instance of the Row is about to be displayed.
    /// You can return a fixed height or `UITableViewAutomaticDimension`.
    /// If you return `nil` the result of the method is ignored and the request is made statically
    /// to the `defaultHeight` of the provided cell class.
    /// If, even this method, return `nil` `TableManager` attempt to evaluate the height of the cell
    /// by creating it and getting the size of the `contentView`.
    var evaluateRowHeight: (() -> (CGFloat?))? { get set }
    
    /// Height for row
    var rowHeight: CGFloat? { get set }
    
    /// Allows the user to configure the cell instance
    ///
    /// - Parameters:
    ///   - cell: cell instance to configure
    ///   - path: destination indexPath of the cell
    func configure(_ cell: UITableViewCell, path: IndexPath)

    /// Allows the user to react when the cell will display
    ///
    /// - Parameters:
    ///   - cell: cell instance to will display
    ///   - path: destination indexPath of the cell
    func willDisplay(_ cell: UITableViewCell, path: IndexPath)

    /// Allows the user to react when the cell end display
    ///
    /// - Parameters:
    ///   - cell: cell instance to end display
    ///   - path: destination indexPath of the cell
    func endDisplay(_ cell: UITableViewCell, path: IndexPath)
    
    
}
