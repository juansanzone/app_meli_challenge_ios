//
//  DetailTextTableViewCell.swift
//  mercadolibre
//
//  Created by Jose Luis Sagredo on 20/10/2019.
//  Copyright © 2019 Jose Luis Sagredo. All rights reserved.
//

import UIKit
import MLUI

class DetailTextTableViewCell: UITableViewCell, TableViewCellProtocol {
    typealias T = DetailTextModel
    
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemTextLabel: UILabel!
    
    func configure(_ detail: DetailTextModel, path: IndexPath) {
        self.itemTitleLabel?.text = detail.title
        self.itemTextLabel?.attributedText = detail.text
    }
    
    func willDisplay(_: DetailTextModel, path: IndexPath) {
    
    }
    
    func endDisplay(_: DetailTextModel, path: IndexPath) {
    
    }
}
