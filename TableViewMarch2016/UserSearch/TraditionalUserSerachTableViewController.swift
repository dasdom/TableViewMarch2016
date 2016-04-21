//
//  TraditionalUserSerachTableViewController.swift
//  TableViewMarch2016
//
//  Created by dasdom on 06.04.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import UIKit

class TraditionalUserSerachTableViewController: UITableViewController, UISearchBarDelegate {
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "User"
        
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
        searchBar.placeholder = "Github username"
        searchBar.delegate = self
        tableView.tableHeaderView = searchBar
        
        tableView.registerClass(TwoLabelCell<User>.self, forCellReuseIdentifier: "Cell")
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

// MARK: - UITableViewDataSource
extension TraditionalUserSerachTableViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let user = users[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TwoLabelCell<User>
        cell.nameLabel.text = user.name
        return cell
    }
}

//MARK - UITableViewDelegate
extension TraditionalUserSerachTableViewController {
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let next = TraditionalRepositoriesTableViewController()
        next.username = self.users[indexPath.row].name
        navigationController?.pushViewController(next, animated: true)
    }
}

//MARK: - UISearchBarDelegate
extension TraditionalUserSerachTableViewController {
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        guard let searchString = searchBar.text where searchString.characters.count > 0 else { return }
        let fetch = APIClient<User>().fetchUsers(forSearchString: searchString)
        fetch { (items, error) -> Void in
            guard let theItems = items else { return }
            //      self.users = theItems.map { $0 }
            self.users = theItems
            self.tableView.reloadData()
        }
    }
}
