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
        setupTheme()
        super.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    private func setupTheme() {
        if #available(iOS 8, *) {
            UITableView.appearance().sectionHeaderHeight = 10
            UITableView.appearance().sectionFooterHeight = 0
            UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0.1))
            //            UITableView.appearance().tableFooterView = UIView()

        }
        if #available(iOS 11, *) {  // iOS 11 及其以上系统运行
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
            UITableView.appearance().estimatedSectionHeaderHeight = 0
            UITableView.appearance().estimatedSectionFooterHeight = 0
        }
    }
}
