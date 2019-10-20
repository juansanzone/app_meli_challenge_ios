//
//  SearchResultsViewController.swift
//  mercadolibre
//
//  Created by Jose Luis Sagredo on 19/10/2019.
//  Copyright © 2019 Jose Luis Sagredo. All rights reserved.
//

import Foundation
import UIKit
import MLDomain
import MLRepository
import MLAutosuggest
import MLTools

class SearchResultsViewController: StateViewController {
    let autosuggest = AutosuggestSearchController()
    let vm = SearchResultsViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(SearchResultsViewController.loadData(_:)), for: UIControl.Event.valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureSearchBar()
        
        /// change state ui
        self.vm.observer = { [weak wSelf = self] in
            guard let sSelf = wSelf else {
                return
            }
            sSelf.uiStateViewModel.state = sSelf.vm.state
        }
                
        self.tableView.registerNib(SearchItemTableViewCell.self)
        self.tableView.estimatedRowHeight = 200
        self.tableView.addSubview(self.refreshControl)
        self.loadData()
    }
    
    func configureSearchBar() {
        self.autosuggest.searchBar.searchTextField.backgroundColor = UIColor(named: "autosuggestBackground")
        self.autosuggest.searchBar.tintColor = UIColor(named: "backButton")
        self.autosuggest.delegateResults = self
        self.autosuggest.searchBar.text = self.vm.query
        self.navigationItem.searchController = self.autosuggest
        self.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    @objc func loadData(_ refreshControl: UIRefreshControl? = nil) {
        self.vm.load()
    }
    
    @IBAction func reload(_ sender: Any) {
        self.loadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SearchResultsViewController {
            (segue.destination as! SearchResultsViewController).vm.query = (sender as! String)
        }
        
        if segue.destination is DetailViewController {
            (segue.destination as! DetailViewController).vm.id = (sender as! String)
        }
    }
    
    func isActiveLoading() -> Bool {
        if !self.vm.data.isEmpty {
            return false
        }
        
        if self.isError() {
            return true
        }
        
        return self.isLoading()
    }
    
    override func onLoadingUI() {
        if self.isActiveLoading() {
            self.errorView?.isHidden = true
            self.tableView.reloadData()
        }
    }
    
    override func onSuccessUI() {
        self.refreshControl.endRefreshing()
        self.tableView.reloadData()
    }
    
    override func onErrorUI(error: Error) {
        self.refreshControl.endRefreshing()
        
        self.errorTitleLabel?.text = error.title.localized
        self.errorDesciptionLabel?.text = error.description.localized
        self.errorImageView?.image = UIImage(named: error.isNetwork() ? "error_network":"error_other")
    
        self.errorView?.isHidden = false
    }
}

extension SearchResultsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.isActiveLoading() ? self.vm.itemsLoading : self.vm.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchItemTableViewCell", for: indexPath) as! SearchItemTableViewCell
        cell.clear()
        if self.isActiveLoading() {
            cell.isUserInteractionEnabled = false
            cell.animateSkeletonStar()
        } else {
            cell.animateSkeletonStop()
            cell.isUserInteractionEnabled = true
            cell.configure(self.vm.data[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if !self.isActiveLoading() {
            self.performSegue(withIdentifier: "ShowDetail", sender: self.vm.data[indexPath.row].id)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension SearchResultsViewController: AutosuggestSearchResultsDelegate {
    func searchBarSearchButtonClicked(_ text: String?) {
        guard self.vm.data.count != 0, text != self.vm.query else {
            self.loadData()
            return
        }
        
        self.performSegue(withIdentifier: "SearchResults", sender: text)
    }
}
