//
//  DetailViewController.swift
//  mercadolibre
//
//  Created by Jose Luis Sagredo on 20/10/2019.
//  Copyright © 2019 Jose Luis Sagredo. All rights reserved.
//

import MLUI
import UIKit
import MLTools

class DetailViewController: StateViewController {
    let vm = DetailViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.registerNib(DetailCollectionMediaTableViewCell.self)
        self.tableView.registerNib(DetailTitleTableViewCell.self)
        self.tableView.registerNib(DetailSubtitleDescriptionTableViewCell.self)
        self.tableView.registerNib(DetailPriceTableViewCell.self)
        self.tableView.registerNib(DetailDescriptionTableViewCell.self)
        self.tableView.registerNib(DetailTextTableViewCell.self)
        
        /// change state ui
        self.vm.observer = { [weak wSelf = self] in
            guard let sSelf = wSelf else {
                return
            }
            sSelf.uiStateViewModel.state = sSelf.vm.state
        }
        
        self.loadData()
        // Do any additional setup after loading the view.
    }
    
    @objc func loadData(_ refreshControl: UIRefreshControl? = nil) {
        self.vm.load()
    }
    
    @IBAction func reload(_ sender: Any) {
        self.loadData()
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
        self.tableView.reloadData()
    }
    
    override func onErrorUI(error: Error) {
        self.errorTitleLabel?.text = error.title.localized
        self.errorDesciptionLabel?.text = error.description.localized
        self.errorImageView?.image = UIImage(named: error.isNetwork() ? "error_network":"error_other")
    
        self.errorView?.isHidden = false
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DetailDescriptionViewController {
            (segue.destination as! DetailDescriptionViewController).id = (sender as! String)
        }
    }

}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func getRow(indexPath: IndexPath) -> RowProtocol {
        return self.isActiveLoading() ? self.vm.itemsLoading[indexPath.row]:self.vm.data[indexPath.row]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.isActiveLoading() ? self.vm.itemsLoading.count : self.vm.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = self.getRow(indexPath: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseIdentifier, for: indexPath)

        if self.isActiveLoading() {
            cell.animateSkeletonStar()
        } else {
            cell.animateSkeletonStop()
            row.configure(cell, path: indexPath)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let row = self.getRow(indexPath: indexPath)
        
        if row._instance is DetailDescriptionTableViewCell {
            self.performSegue(withIdentifier: "ShowDetail", sender: self.vm.id)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
