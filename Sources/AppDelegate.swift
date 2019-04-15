//
//  AppDelegate.swift
//  BeeApp
//
//  Created by 姚晨峰 on 2019/4/12.
//  Copyright © 2019 jyc99. All rights reserved.
//

import UIKit
import BeeKit
@UIApplicationMain
class AppDelegate: BHMainAppDelegate {

    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        BHURLRouter.shared().addURLActionRequestMiddleware("URLRouterRewriteRequestMiddleware", isSingleton: true, frameworkName: "beeApp")
        super.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
}
