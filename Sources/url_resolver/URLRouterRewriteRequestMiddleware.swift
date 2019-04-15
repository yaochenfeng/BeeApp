//
//  BHURLRouterRewriteRequestMiddleware.swift
//  finance
//
//  Created by 姚晨峰 on 2019/4/12.
//  Copyright © 2019 jyc99. All rights reserved.
//

import UIKit
class URLRouterRewriteRequestMiddleware: NSObject, BHURLActionRequestMiddleware {
    var config = [String: String]()
    override init() {
        super.init()
        config["app://root/tab0"] = "https://m.jyc99.com/"
        config["app://root/tab1"] = "https://m.jyc99.com/product"
        config["app://root/tab2"] = "https://m.jyc99.com/discover"
        config["app://root/tab3"] = "https://m.jyc99.com/mine"
    }
    func processURLActionRequest(_ request: BHURLActionRequest) -> BHURLActionResponse? {
        if let rewirte = config[request.url.schemehostpath] {
            let response = BHURLActionResponse(asNone: ())
            response.responseType = .redirect
            if let query = request.url.query, let url = URL(string: rewirte + "?" + query) {
                    response.redirectURL = url
                    return response
            } else if let url = URL(string: rewirte) {
                    response.redirectURL = url
                    return response
            }
        }
        return nil
    }

}
