//
//  AppDelegate.swift
//  TableViewMarch2016
//
//  Created by dasdom on 28.03.16.
//  Copyright © 2016 dasdom. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

//    window?.rootViewController = UINavigationController(rootViewController: UserSearchTableViewController<User>())
    window?.rootViewController = UINavigationController(rootViewController: TraditionalUserSerachTableViewController())
    window?.makeKeyAndVisible()
    return true
  }
}

