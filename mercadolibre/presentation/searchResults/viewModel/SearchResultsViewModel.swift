//
//  SearchResultsViewModel.swift
//  mercadolibre
//
//  Created by Jose Luis Sagredo on 19/10/2019.
//  Copyright © 2019 Jose Luis Sagredo. All rights reserved.
//

import UIKit
import MLDomain
import MLTools
import MLRepository

class SearchResultsViewModel:ViewModel<[SearchItem]> {
    var itemsLoading = 7
    var query:String!
    
    init() { super.init([]) }
    
    func load(){
        self.loading()
        UseCase.search.get(query: self.query) {[weak self] (result, responbse, error) in
            if let result = result {
                self?.data.removeAll()
                self?.data.append(contentsOf: result.items)
                self?.success()
                return
            }
            if let error = error {
                self?.error(error: error)
            }
        }
    }
}
