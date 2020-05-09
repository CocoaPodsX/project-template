//
//  AppDelegate.swift
//  Example iOS
//
//  Created by _name0x07 on _date0x07.
//  Copyright © _year0x07 _name0x07. All rights reserved.
//

import UIKit
import _Template_Project0x07

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = NavigationController(rootViewController: ViewController())
        window?.makeKeyAndVisible()
        return true
    }
}
