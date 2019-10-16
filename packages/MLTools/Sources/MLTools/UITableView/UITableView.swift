//
//  UITableView.swift
//  
//
//  Created by Jose Luis Sagredo on 15/10/2019.
//

import Foundation
import UIKit

public extension UITableView {
    func registerNib(_ cell:UITableViewCell.Type) {
        self.register(UINib(nibName: "\(cell)", bundle: nil),forCellReuseIdentifier: "\(cell)")
    }
}
