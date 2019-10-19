//
//  SearchItemTableViewCell.swift
//  mercadolibre
//
//  Created by Jose Luis Sagredo on 19/10/2019.
//  Copyright © 2019 Jose Luis Sagredo. All rights reserved.
//

import UIKit
import MLTools
import MLRepository

class SearchItemTableViewCell: UITableViewCell {
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(_ item:SearchItem) {
        self.itemTitleLabel.text = item.title
        self.itemPriceLabel.text = "$ \(item.price.amount.separatorString())"
        self.itemImageView.imageURL(item.pictures.stack.normal)
    }
    
    func clear() {
        self.itemTitleLabel.text = ""
        self.itemPriceLabel.text = ""
        self.itemImageView.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
