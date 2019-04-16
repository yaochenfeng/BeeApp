//
//  AppTabbarViewController.swift
//  beeApp
//
//  Created by 姚晨峰 on 2019/4/15.
//  Copyright © 2019 jyc99. All rights reserved.
//

import UIKit

class AppTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var childVCs = [UIViewController]()
        for ind in 0...5 {
            if let url = URL(string: "app://root/tab\(ind)?login=true"), let bvc  = BHShareKit.shared().viewController(for: url) {
                childVCs.append(bvc)
                switch ind {
                case 0:
                    bvc.tabBarItem.title = "首页"
                case 1:
                    bvc.tabBarItem.title = "出借"
                case 2:
                    bvc.tabBarItem.title = "发现"
                case 3:
                    bvc.tabBarItem.title = "我的"
                default:
                    break
                }
                bvc.tabBarItem.image = UIImage(named: "tab_\(ind + 1)")?.withRenderingMode(.alwaysOriginal)
                bvc.tabBarItem.selectedImage = UIImage(named: "tab_\(ind + 1)_selected")?.withRenderingMode(.alwaysOriginal)
            }
        }
        setupVCs(childVCs)
    }
    /// 设置tabbar子控制器
    private func setupVCs(_ vcs: [UIViewController]) {
        var navChid = [AppNavigationController]()
        var childs = vcs
        if vcs.count == 0 {
            childs = self.children
        }
        for child in childs {
            if let nav  = child as? UINavigationController, let top = nav.children.first {
                navChid.append(AppNavigationController(rootViewController: top))
            } else {
                navChid.append(AppNavigationController(rootViewController: child))
            }
            navChid.last?.tabBarItem = child.tabBarItem
        }
        if navChid.count > 0 {
            setViewControllers(navChid, animated: false)
        }
    }

}
