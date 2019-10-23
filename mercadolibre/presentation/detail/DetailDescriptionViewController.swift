//
//  DetailDescriptionViewController.swift
//  mercadolibre
//
//  Created by Jose Luis Sagredo on 20/10/2019.
//  Copyright © 2019 Jose Luis Sagredo. All rights reserved.
//

import MLUI
import UIKit
import MLTools
import MLDomain
import MLLogging
import MLRepository

class DetailDescriptionViewController: StateViewController {
    var id:String!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UseCase.detail.getDescription(id: self.id) { [weak self] (result, response, error) in
            if let error = error {
                logger.error("The error occurred when obtaining the detail of id \(self?.id ?? "unknown")", error: error)
                self?.navigationController?.popViewController(animated: true)
            } else {
                self?.textView.text = result?.sections
                .filter({$0.type == .text})
                .map({$0.data as! DetailSectionsDataText})
                .map({$0.text})
                .joined(separator: "\n")
            }
        }
        
    }
    
}
