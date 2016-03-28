//
//  Repository.swift
//  TableViewMarch2016
//
//  Created by dasdom on 28.03.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import Foundation

struct Repository: LabelsPresentable, DictCreatable {
  let id: Int
  let name: String
  let description: String
  
  init?(dict: [NSObject: AnyObject]) {
    guard let theId = dict["id"] as? Int else { return nil }
    guard let theName = dict["name"] as? String else { return nil }
    guard let theDescription = dict["description"] as? String else { return nil }
    
    id = theId
    name = theName
    description = theDescription
    
  }
  
  var texts: [String] { return [name, description] }
}