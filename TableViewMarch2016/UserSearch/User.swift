//
//  User.swift
//  TableViewMarch2016
//
//  Created by dasdom on 28.03.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import Foundation

protocol UserProtocol {
  var name: String { get }
}

struct User: LabelsPresentable, DictCreatable, UserProtocol {
  let id: Int
  let name: String
  
  init?(dict: [NSObject : AnyObject]) {
    guard let theId = dict["id"] as? Int else { return nil }
    guard let theName = dict["login"] as? String else { return nil }
    
    id = theId
    name = theName
  }
  
  var texts: [String] { return [name] }
}