//
//  DetailSubtitleDescriptionTableViewCell.swift
//  mercadolibre
//
//  Created by Jose Luis Sagredo on 20/10/2019.
//  Copyright © 2019 Jose Luis Sagredo. All rights reserved.
//

import UIKit
import MLUI

class DetailSubtitleDescriptionTableViewCell: UITableViewCell, TableViewCellProtocol {
    typealias T = String
    
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    func configure(_ description: String, path: IndexPath) {
        self.itemDescriptionLabel?.text = description
    }
    
    func willDisplay(_: String, path: IndexPath) {
        
    }
    
    func endDisplay(_: String, path: IndexPath) {
        
    }
}
