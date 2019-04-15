//
//  TelSchemeURLResolver.swift
//  beeApp
//
//  Created by 姚晨峰 on 2019/4/15.
//  Copyright © 2019 jyc99. All rights reserved.
//

import UIKit

class TelSchemeURLResolver: NSObject, BHURLRouterHandlerProtocol {
    func handler(for request: BHURLActionRequest) -> Any {
        DispatchQueue.main.async {
            if let resourceSpecifier = (request.url as NSURL).resourceSpecifier, let url = URL(string: "telprompt://\(resourceSpecifier)") {
                if Constants.isSim {
                    BeeUtils.show("模拟器不支持打电话:\(resourceSpecifier)")
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
        return BHURLActionResponse(asNone: ())
    }
}
