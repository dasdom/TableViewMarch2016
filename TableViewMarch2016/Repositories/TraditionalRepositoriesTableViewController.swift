//
//  TraditionalRepositoriesTableViewController.swift
//  TableViewMarch2016
//
//  Created by dasdom on 08.04.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import UIKit

class TraditionalRepositoriesTableViewController: UITableViewController {
    
    var username: String?
    var repositories = [Repository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let username = username where username.characters.count > 0 else { return }
        let fetch = APIClient<Repository>().fetchItems(forUser: username)
        fetch { (items, error) -> Void in
            self.title = username
            guard let theItems = items else { return }
            //      self.data = theItems.map { $0 }
            self.repositories = theItems
            self.tableView.reloadData()
        }
        
        tableView.registerClass(TwoLabelCell<Repository>.self, forCellReuseIdentifier: "Cell")
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

// MARK: - UITableViewDataSource
extension TraditionalRepositoriesTableViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let repository = repositories[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TwoLabelCell<Repository>
        cell.nameLabel.text = repository.name
        cell.descriptionLabel.text = repository.description
        return cell
    }
}

//MARK - UITableViewDelegate
extension TraditionalRepositoriesTableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let nextViewController = DetailViewController()
        nextViewController.repository = repositories[indexPath.row]
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}