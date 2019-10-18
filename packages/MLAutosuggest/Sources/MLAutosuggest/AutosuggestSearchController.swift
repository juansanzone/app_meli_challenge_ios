//
//  AutosuggestSearchController.swift
//  mercadolibre
//
//  Created by Jose Luis Sagredo on 18/10/2019.
//  Copyright © 2019 Jose Luis Sagredo. All rights reserved.
//

import UIKit
import MLDomain
import MLRepository

public class AutosuggestSearchController: UISearchController {
    public var delegateResults:AutosuggestSearchResultsDelegate? = nil
    
    public convenience init() {
        self.init(searchResultsController: AutosuggestController())
        self.searchBar.placeholder = "Busca"
        self.searchBar.tintColor = UIColor.black
        self.searchBar.searchBarStyle = .minimal
        self.searchBar.searchTextField.backgroundColor = UIColor.white
        self.searchBar.autocapitalizationType = .none
        self.searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.searchBar.delegate = self
        self.searchResultsUpdater = self
        definesPresentationContext = true
        self.autosuggestController.delegate = self
    }
    
    var autosuggestController:AutosuggestController {
        get {
            return self.searchResultsController as! AutosuggestController
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension AutosuggestSearchController: UISearchBarDelegate {
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.delegateResults?.searchBarSearchButtonClicked(searchBar.text)
        self.searchBar.endEditing(true)
        self.dismiss(animated: true) {
            
        }
    }
}

extension AutosuggestSearchController: AutosuggestControllerDelegate {
    public func didSelectQuery(_ text: String?) {
        self.searchBar.text = text
        self.searchBarSearchButtonClicked(self.searchBar)
    }
}

extension AutosuggestSearchController : UISearchResultsUpdating {
    func reload(suggesteds: Suggesteds) {
        self.autosuggestController.suggesteds = suggesteds
        self.autosuggestController.reload()
    }
    
    public func updateSearchResults(for searchController: UISearchController) {
        guard let searchBarText = searchController.searchBar.text, !searchBarText.isEmpty else { return }
        
        UseCase.autosuggest.get(query: searchBarText) {[weak self] (suggesteds, response, error) in
            if (error != nil) {
                print(error.debugDescription)
                return
            }
            
            guard let suggesteds = suggesteds else { return }
            
            self?.reload(suggesteds: suggesteds)
        }
        
    }
}

public protocol AutosuggestSearchResultsDelegate {
    func searchBarSearchButtonClicked(_ text: String?)
}
