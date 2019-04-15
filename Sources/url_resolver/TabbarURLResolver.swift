//
//  TabbarURLResolver.swift
//  finance
//
//  Created by 姚晨峰 on 2019/4/11.
//  Copyright © 2019 jyc99. All rights reserved.
//

import Foundation
import BeeKit
class TabbarURLResolver: NSObject, BHURLRouterHandlerProtocol {
    var tabbarvc: UITabBarController?
    func handler(for request: BHURLActionRequest) -> Any {
        if tabbarvc == nil {
            tabbarvc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? AppTabbarViewController
        }
        if request.sourceController == nil, let tab = tabbarvc {
            return BHURLActionResponse(viewController: tab)
        } else {
            if let tabbarValue = request.query["tabbar"] {
                if let selectIndex = Int(tabbarValue) {
                    print("item = \(selectIndex)")
                    self.tabbarvc?.selectedIndex = selectIndex
                }
            }
        }
        return BHURLActionResponse(asNone: ())
    }
}
