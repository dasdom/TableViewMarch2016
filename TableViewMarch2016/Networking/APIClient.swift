//
//  APIClient.swift
//  TableViewMarch2016
//
//  Created by dasdom on 28.03.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import UIKit

struct APIClient<T: DictCreatable> {
  
  func fetchItems(forUser userName: String) -> (completion: (items: [T]?, error: ErrorType?) -> Void) -> Void {
    return { completion in
      
      guard let url = GithubURL.Repositories(userName).url() else {
        let outputError = NSError(domain: "Invalid username", code: 111, userInfo: nil)
        completion(items: nil, error: outputError)
        return
      }
      
      let fetch = self.fetchItems(forURL: url)
      fetch(completion: completion)
    }
  }
  
  func fetchUsers(forSearchString string: String) -> (completion: (items: [T]?, error: ErrorType?) -> Void) -> Void {
    return { completion in
      
      guard let url = GithubURL.Users(string).url() else {
        let outputError = NSError(domain: "Invalid search string", code: 111, userInfo: nil)
        completion(items: nil, error: outputError)
        return
      }
      
      let fetch = self.fetchItems(forURL: url, inDictionaryForKey: "items")
      fetch(completion: completion)
    }
  }
  
  func fetchItems(forURL url: NSURL, inDictionaryForKey key: String? = nil) -> (completion: (items: [T]?, error: ErrorType?) -> Void) -> Void {
    return { completion in
      var outputItems: [T]? = nil
      var outputError: ErrorType? = nil
      
      UIApplication.sharedApplication().networkActivityIndicatorVisible = true
      let session = NSURLSession.sharedSession()
      session.dataTaskWithURL(url) { (data, response, error) -> Void in
        
        defer {
          dispatch_async(dispatch_get_main_queue(), { () -> Void in
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            completion(items: outputItems, error: outputError)
          })
        }
        
        outputError = error
        
        guard let data = data else { return }
        
        do {
          var itemArray: [[String: AnyObject]] = []
          if let key = key {
            guard let dict = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String: AnyObject] else {
              outputError = NSError(domain: "Invalid response", code: 112, userInfo: nil)
              return
            }
            guard let array = dict[key] as? [[String: AnyObject]] else {
              outputError = NSError(domain: "Invalid response", code: 112, userInfo: nil)
              return
            }
            itemArray = array
          } else {
            guard let array = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [[String: AnyObject]] else {
              outputError = NSError(domain: "Invalid response", code: 112, userInfo: nil)
              return
            }
            itemArray = array
          }
          
          var tempItems = [T]()
          for dict in itemArray {
            if let item = T(dict: dict) {
              tempItems.append(item)
            }
          }
          outputItems = tempItems
          return
          
        } catch {
          outputError = error
        }
        
        }.resume()
    }
  }
}
