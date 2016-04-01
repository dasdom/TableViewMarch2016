//
//  RepositoriesTableViewController.swift
//  TableViewMarch2016
//
//  Created by dasdom on 28.03.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import UIKit

class RepositoriesTableViewController<T: protocol<DictCreatable, LabelsPresentable>>: TableViewController<T, TwoLabelCell> {

  var username: String? {
    didSet {
      guard let username = username where username.characters.count > 0 else { return }
      let fetch = APIClient<T>().fetchItems(forUser: username)
      fetch { (items, error) -> Void in
        self.title = username
        guard let theItems = items else { return }
        self.data = theItems.map { $0 }
      }
    }
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let nextViewController = DetailViewController()
    nextViewController.repository = data[indexPath.row] as? Repository
    navigationController?.pushViewController(nextViewController, animated: true)
  }
}
