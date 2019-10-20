//
//  DetailPriceTableViewCell.swift
//  mercadolibre
//
//  Created by Jose Luis Sagredo on 20/10/2019.
//  Copyright © 2019 Jose Luis Sagredo. All rights reserved.
//

import UIKit
import MLUI
import MLRepository

class DetailPriceTableViewCell: UITableViewCell, TableViewCellProtocol {
    typealias T = DetailPrice
    
    @IBOutlet weak var itemPirceLabel: UILabel!
    @IBOutlet weak var itemPriceOriginalLabel: UILabel!
    @IBOutlet weak var itemRateLabel: UILabel!
    
    func configure(_ price: DetailPrice, path: IndexPath) {
        //price.rate
        self.itemPirceLabel.text = "$ \(Int(price.price))"
        
        if let priceOriginal = price.priceOriginal {
            self.itemPriceOriginalLabel.attributedText = NSAttributedString(
                string: "$ \(Int(priceOriginal))",
                attributes: [
                    NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue
                ]
            )
        } else {
            self.itemPriceOriginalLabel.text = ""
        }
        
        if let rate = price.rate, rate != 0 {
            self.itemRateLabel.text = "\(rate)% OFF"
        } else {
            self.itemRateLabel.text = ""
        }

    }
    
    func willDisplay(_: DetailPrice, path: IndexPath) {
        
    }
    
    func endDisplay(_: DetailPrice, path: IndexPath) {
        
    }
}
