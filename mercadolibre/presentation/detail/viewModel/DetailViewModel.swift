//
//  DetailViewModel.swift
//  mercadolibre
//
//  Created by Jose Luis Sagredo on 20/10/2019.
//  Copyright © 2019 Jose Luis Sagredo. All rights reserved.
//

import UIKit
import MLDomain
import MLTools
import MLRepository
import MLUI

class DetailViewModel:ViewModel<[RowProtocol]> {
    var itemsLoading = [RowProtocol]()
    var id:String!
    var detail:Detail?
    
    init() { super.init([]) }
    
    func load(){
        self.detailMapRowLoading()
        self.loading()
        UseCase.detail.get(id: self.id) {[weak self] (result, response, error) in
            if let result = result {
                self?.detail = result
                self?.detailMapRows()
                self?.success()
                self?.itemsLoading.removeAll()
                return
            }
            if let error = error {
                print(error)
                self?.error(error: error)
            }
        }
    }
    
    func detailMapRowLoading() {
        self.itemsLoading.removeAll()

        self.itemsLoading = [
            ItemRow<DetailTitleTableViewCell>.init(model: ""),
            ItemRow<DetailSubtitleDescriptionTableViewCell>.init(model: ""),
            ItemRow<DetailPriceTableViewCell>.init(model: DetailPrice.skeleton() )
        ]
    }
    
    func detailMapRows() {
        self.data.removeAll()
                
        if let pictures = self.detail?.info?.pictures {
            self.data.append(ItemRow<DetailCollectionMediaTableViewCell>.init(model: pictures))
        }
        
        if let title = self.detail?.info?.title {
            self.data.append(ItemRow<DetailTitleTableViewCell>.init(model: title))
        }
        
        if let subtitle = self.detail?.info?.subtitle {
            self.data.append(ItemRow<DetailSubtitleDescriptionTableViewCell>.init(model: subtitle.description.removeHTML()))
        }
        
        if let price = self.detail?.info?.price {
            self.data.append(ItemRow<DetailPriceTableViewCell>.init(model: price))
        }
        
        for section in self.detail?.sections ?? [] {
            switch section.type {
                case .description:
                    if let data = section.data as? DetailSectionsDataDescription {
                        self.data.append(
                            ItemRow<DetailDescriptionTableViewCell>.init(
                                model: DetailTextModel(
                                    title: section.title ?? "",
                                    text: NSAttributedString(string: data.description)
                                )
                            )
                        )
                    }
                    break
                case .warranty:
                    if let data = section.data as? DetailSectionsDataWarranty {
                        let text = NSMutableAttributedString(string: "")
                        
                        for item in data.sections {
                            text.append(NSAttributedString(string: "\n\(item.title.removeHTML())\n", attributes: [
                                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular),
                            ]))
                            text.append(NSAttributedString(string: "\(item.subtitle.removeHTML())\n", attributes: [
                                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.thin),
                                NSAttributedString.Key.foregroundColor: UIColor.gray
                            ]))
                        }
                        
                        let paragraphStyle = NSMutableParagraphStyle()
                        paragraphStyle.lineSpacing = 3
                        text.addAttribute(
                            NSAttributedString.Key.paragraphStyle,
                            value:paragraphStyle,
                            range:NSMakeRange(0, text.length)
                        )
                        
                        self.data.append(
                            ItemRow<DetailTextTableViewCell>.init(
                                model: DetailTextModel(
                                    title: section.title ?? "",
                                    text: text
                                )
                            )
                        )
                        
                    }
                break
                default:
                    break
                }
        }
        
    }
}
