//
//  DetailCollectionMediaTableViewCell.swift
//  mercadolibre
//
//  Created by Jose Luis Sagredo on 20/10/2019.
//  Copyright © 2019 Jose Luis Sagredo. All rights reserved.
//

import UIKit
import MLUI

class DetailCollectionMediaTableViewCell: UITableViewCell, TableViewCellProtocol, UICollectionViewDelegate, UICollectionViewDataSource {
    typealias T = [URL]
    
    @IBOutlet weak var itemCollectionView: UICollectionView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    
    var pictures = [URL]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.itemCollectionView.register(
            UINib.init(nibName: "DetailMediaCollectionViewCell", bundle: nil),
            forCellWithReuseIdentifier: "DetailMediaCollectionViewCell"
        )
        
        self.itemTitleLabel.layer.masksToBounds = true
        self.itemTitleLabel.layer.cornerRadius = 8.0
        
        DispatchQueue.main.async {
            let layout = self.itemCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
            layout.itemSize = self.frame.size
        }
    }

    func configure(_ pictures: [URL], path: IndexPath) {
        self.pictures = pictures
        self.itemCollectionView.reloadData()
        
        self.itemTitleLabel.text = " \(pictures.count) Fotos "
        self.itemTitleLabel.isHidden = pictures.count <= 1 ? true:false
    }
    
    func willDisplay(_: [URL], path: IndexPath) {
        
    }
    
    func endDisplay(_: [URL], path: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailMediaCollectionViewCell", for: indexPath as IndexPath) as! DetailMediaCollectionViewCell
        
        cell.collectionimageView.imageURL(self.pictures[indexPath.row])
        
        return cell
    }
    
    
}
