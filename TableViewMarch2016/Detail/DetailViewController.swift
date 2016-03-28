//
//  DetailViewController.swift
//  TableViewMarch2016
//
//  Created by dasdom on 28.03.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  var repository: Repository?
  
  override func loadView() {
    let contentView = DetailView()
    contentView.backgroundColor = UIColor.whiteColor()
    if let repository = repository {
      contentView.nameLabel.text = repository.name
      contentView.descriptionLabel.text = repository.description
    }
    view = contentView
  }
  
  override func viewWillLayoutSubviews() {
    (view as? DetailView)?.stackView.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 20).active = true
  }
}
