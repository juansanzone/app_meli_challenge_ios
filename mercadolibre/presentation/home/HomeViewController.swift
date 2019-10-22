//
//  HomeViewController.swift
//  mercadolibre
//
//  Created by Jose Luis Sagredo on 19/10/2019.
//  Copyright © 2019 Jose Luis Sagredo. All rights reserved.
//

import UIKit
import MLTools
import MLAutosuggest

class HomeViewController: UIViewController {
    let autosuggest = AutosuggestSearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureSearchBar()
        // Do any additional setup after loading the view.
    }
    
    func configureSearchBar() {
        self.autosuggest.searchBar.searchTextField.backgroundColor = UIColor(named: "autosuggestBackground")
        self.autosuggest.searchBar.tintColor = UIColor(named: "backButton")
        self.autosuggest.delegateResults = self
        self.navigationItem.searchController = self.autosuggest
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.autosuggest.fixOrigin()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SearchResultsViewController {
            (segue.destination as! SearchResultsViewController).vm.query = (sender as! String)
        }
    }


}

extension HomeViewController: AutosuggestSearchResultsDelegate {
    func searchBarSearchButtonClicked(_ text: String?) {
        self.performSegue(withIdentifier: "SearchResults", sender: text)
    }
}
