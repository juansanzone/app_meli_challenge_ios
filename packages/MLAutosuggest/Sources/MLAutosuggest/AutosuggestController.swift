//
//  AutosuggestController.swift
//  mercadolibre
//
//  Created by Jose Luis Sagredo on 18/10/2019.
//  Copyright © 2019 Jose Luis Sagredo. All rights reserved.
//

import UIKit
import MLRepository

public class AutosuggestController: UITableViewController {
    public var suggesteds : Suggesteds?
    public var delegate:AutosuggestControllerDelegate? = nil
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AutosuggestViewCell")
    }
    
    func reload() {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override public func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.suggesteds?.queries?.count ?? 0
    }


    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AutosuggestViewCell", for: indexPath)
        cell.textLabel?.text = self.suggesteds?.queries?[indexPath.row].query
        return cell
    }

    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didSelectQuery(self.suggesteds?.queries?[indexPath.row].query)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

public protocol AutosuggestControllerDelegate {
    func didSelectQuery(_ text: String?)
}
