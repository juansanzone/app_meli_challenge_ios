//
//  DetailTitleTableViewCell.swift
//  mercadolibre
//
//  Created by Jose Luis Sagredo on 20/10/2019.
//  Copyright © 2019 Jose Luis Sagredo. All rights reserved.
//

import UIKit
import MLUI

class DetailTitleTableViewCell: UITableViewCell, TableViewCellProtocol {
    typealias T = String
    
    @IBOutlet weak var itemTitleLabel: UILabel!
    
    func configure(_ title: String, path: IndexPath) {
        self.itemTitleLabel?.text = title
    }
    
    func willDisplay(_: String, path: IndexPath) {
        
    }
    
    func endDisplay(_: String, path: IndexPath) {
        
    }
}
