//
//  ItemRow.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation
import UIKit

open class ItemRow<Cell: TableViewCellProtocol>: RowProtocol where Cell: UITableViewCell {
    ///Define information Reusable
    public struct ReusableCreational {
        var cell : Cell.T
    }
    
    ///Define type for configurator
    public typealias TableRowConfigurator = ((_ maker: ItemRow) -> (Void))
    
    /// Item represented by the cell
    public let model: Cell.T
    
    /// Optional identifier of the row
    public var identifier: String? = nil
    
    /// Hash value
    public var hashValue: Int {
        return ObjectIdentifier(self).hashValue
    }
    
    /// Reuse identifier of the cell
    public var reuseIdentifier: String {
        return Cell.reuseIdentifier
    }
    
    /// When associated cell instance is dequeued this contains
    /// the indexPath of the cell itself.
    /// You should not modify it.
    public var _indexPath: IndexPath?
    public var indexPath: IndexPath? {
        get { return self._indexPath }
    }
    
    /// Internal reference (weak) to cell instance.
    /// You should not reference to it (we cannot assign private var in
    /// protocols yet); use `cell` property instead, it will return
    /// the instance of the cell used to represent the row itself.
    public weak var _instance: UITableViewCell?
    
    /// Weak reference to cell instances
    public var cell: Cell? {
        get { return _instance as? Cell }
    }
    
    /// Estimated height of the cell. Used when autosizing is enabled
    public var evaluateEstimatedHeight: (() -> (CGFloat?))? = nil
    
    /// Fixed height for cell
    public var evaluateRowHeight: (() -> (CGFloat?))? = nil
    
    /// Private
    public var _estimatedHeight: CGFloat? {
        return Cell.estimatedHeight
    }
    
    /// You can use this value if your row has a fixed height.
    /// By setting a non `nil` value your both `evaluateEstimatedHeight` and
    /// `evaluateRowHeight` will be ignored.
    public var rowHeight: CGFloat? = nil
    
    /// You can use this value to disable or enable highlight of the cell.
    /// If non `nil` value is set `onShouldHighlight` will be not called.
    public var shouldHighlight: Bool? = nil
    
    /// Fixed height of the cell
    /// If you have not provided a valid height at instance level for given `Row` this is the
    /// last chance to return a valid value. This method is called statically and you can implement
    /// it if your cell does need to change the height but has a fixed height value (or automatic one).
    public var _defaultHeight: CGFloat? {
        return Cell.defaultHeight
    }
    
    /// Static level highlight of the cell.
    /// This method is called statically and you can implement it in your cell.
    public var _shouldHighlight: Bool? {
        return Cell.shouldHightlight
    }
    
    /// Class which represent the cell
    public var cellType: AnyClass {
        return Cell.self
    }
    
    /// Configure cell
    ///
    /// - Parameter instance: cell instance
    /// - Parameter path: index path
    open func configure(_ instance: UITableViewCell, path: IndexPath) {
        self._instance = instance // set instance of the cell
        self._indexPath = path // set the indexPath of the cell
        self.cell?.configure(self.model, path: path)
    }
    
    /// Will display cell
    ///
    /// - Parameter instance: cell instance
    /// - Parameter path: index path
    public func willDisplay(_ cell: UITableViewCell, path: IndexPath) {
        self.cell?.willDisplay(self.model, path: path)
    }

    /// End display cell
    ///
    /// - Parameter instance: cell instance
    /// - Parameter path: index path
    public func endDisplay(_ cell: UITableViewCell, path: IndexPath) {
        self.cell?.endDisplay(self.model, path: path)
    }
    
    /// Initialize a new row
    ///
    /// - Parameters:
    ///   - item: item represented by the row
    ///   - maker: maker block to configure the object
    public init(id identifier: String? = nil, model: Cell.T, _ configurator: TableRowConfigurator? = nil) {
        self.identifier = identifier
        self.model = model
        configurator?(self)
    }
    
    /// Create a new set of rows of the same type with the same maker
    ///
    /// - Parameters:
    ///   - count: number of cells
    ///   - item: item represented by the row
    ///   - maker: maker block to configure the object
    /// - Returns: a list of the row
    public static func create(_ items: [ReusableCreational], _ configurator: TableRowConfigurator? = nil) -> [ItemRow] {
        guard items.count > 0 else { return [] }
        return items.map { ItemRow(model: $0.cell, configurator) }
    }
}
