//
//  TableViewController.swift
//  TableViewMarch2016
//
//  Created by dasdom on 28.03.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import UIKit

class TableViewController<Cell: UITableViewCell where Cell: Configurable>: UITableViewController {
  typealias DataType = Cell.DataType
  private let cellIdentifier = String(Cell)
  var data = [DataType]() {
    didSet {
      tableView.reloadData()
      if tableView.numberOfRowsInSection(0) > 0 {
        tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0,inSection: 0),
                                         atScrollPosition: .Top,
                                         animated: true)
      }
    }
  }
  
  init() { super.init(nibName: nil, bundle: nil) }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.registerClass(Cell.self, forCellReuseIdentifier: cellIdentifier)
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 60
  }
  
  // MARK: - Table view data source
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  override func tableView(tableView: UITableView,
                          cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,
                                                           forIndexPath: indexPath) as! Cell
    cell.config(withItem: data[indexPath.row])
    return cell
  }
}
