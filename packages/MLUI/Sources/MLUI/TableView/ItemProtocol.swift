//
//  ItemProtocol.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation
import UIKit

///Item specific protocol add more specifications for ArtearElementProtocol
public protocol ItemProtocol : ElementProtocol {
    
    /// Instance of the represented cell for this row (set only if row is visible, maybe `nil`)
    var _instance:            UICollectionViewCell? { get }
    
    /// This is for internal purpose only.
    /// Return the valid value of associated `DeclarativeCell`'s `defaultSize`.
    var _defaultSize: CGSize? { get }
    
    ///Define default cell size
    var _defaultConveyorSizeForCalculate: CGSize? {get}
    
    /// If should be adaptable for conveyor calculate
    var isAdaptableForConveyor: Bool {get}
    
    /// Allows the user to configure the cell instance
    ///
    /// - Parameters:
    ///   - cell: cell instance to configure
    ///   - path: destination indexPath of the cell
    func configure(_ cell: UICollectionViewCell, path: IndexPath)

    /// Allows the user to react when the cell will display
    ///
    /// - Parameters:
    ///   - cell: cell instance to will display
    ///   - path: destination indexPath of the cell
    func willDisplay(_ cell: UICollectionViewCell, path: IndexPath)
    
    /// Allows the user to react when the cell end display
    ///
    /// - Parameters:
    ///   - cell: cell instance to end display
    ///   - path: destination indexPath of the cell
    func endDisplay(_ cell: UICollectionViewCell, path: IndexPath)
    
    /// Allows the user to calculate the cell height
    ///
    /// - Parameters:
    ///   - width: cell width
    /// - Returns:
    ///   - Calculated cell height
    func calculateHeight(forWidth width: CGFloat) -> CGFloat?

    /// Size cell calculate
    ///
    /// - Returns: calculated size
    ///
    func calculateSizeForConveyor() -> CGSize?
}
