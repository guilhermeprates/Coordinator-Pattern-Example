//
//  AppDelegate.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 19/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  private var appCoordinator: AppCoordinator?

  var window: UIWindow?

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window

    appCoordinator = AppCoordinator(window: window)
    appCoordinator?.start()

    return true
  }

}
