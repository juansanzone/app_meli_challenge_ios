//
//  DetailDescriptionTableViewCell.swift
//  mercadolibre
//
//  Created by Jose Luis Sagredo on 20/10/2019.
//  Copyright © 2019 Jose Luis Sagredo. All rights reserved.
//

import UIKit
import MLUI

class DetailDescriptionTableViewCell: UITableViewCell, TableViewCellProtocol {
    typealias T = DetailTextModel
    
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    func configure(_ detail: DetailTextModel, path: IndexPath) {
        self.itemTitleLabel?.text = detail.title
        self.itemDescriptionLabel?.attributedText = detail.text
    }
    
    func willDisplay(_: DetailTextModel, path: IndexPath) {
    
    }
    
    func endDisplay(_: DetailTextModel, path: IndexPath) {
    
    }
}

struct DetailTextModel {
    let title:String
    let text:NSAttributedString
}
