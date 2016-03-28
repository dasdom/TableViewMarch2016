//
//  DetailView.swift
//  TableViewMarch2016
//
//  Created by dasdom on 28.03.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import UIKit

class DetailView: UIView {

  let nameLabel: UILabel
  let descriptionLabel: UILabel
  let stackView: UIStackView
  
  override init(frame: CGRect) {
    nameLabel = UILabel()
    nameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle1)
    nameLabel.textAlignment = .Center
    
    descriptionLabel = UILabel()
    descriptionLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    descriptionLabel.numberOfLines = 2
    descriptionLabel.textAlignment = .Center
    
    stackView = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .Vertical
    stackView.spacing = 5
    
    super.init(frame: frame)
    
    addSubview(stackView)
    
    let views = ["stackView": stackView]
    var layoutConstraints = [NSLayoutConstraint]()
    layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("|-[stackView]-|", options: [], metrics: nil, views: views)
    NSLayoutConstraint.activateConstraints(layoutConstraints)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
