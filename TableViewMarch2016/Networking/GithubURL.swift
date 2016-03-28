//
//  GithubURL.swift
//  TableViewMarch2016
//
//  Created by dasdom on 28.03.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import Foundation

enum GithubURL {
  case Repositories(String)
  case Users(String)
  
  var baseURLString: String { return "https://api.github.com" }
  
  func url() -> NSURL? {
    switch self {
    case .Repositories(let user):
      return NSURL(string: "\(baseURLString)/users/\(user)/repos")
    case .Users(let searchString):
      guard let encodedSearchString = searchString.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet()) else { return nil }
      return NSURL(string: "\(baseURLString)/search/users?q=\(encodedSearchString)")
    }
  }
}