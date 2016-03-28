//
//  DictCreatable.swift
//  TableViewMarch2016
//
//  Created by dasdom on 28.03.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import Foundation

protocol DictCreatable {
  init?(dict: [NSObject: AnyObject])
}