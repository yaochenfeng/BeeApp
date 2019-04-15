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
        config["app://root/tab1"] = "https://m.jyc99.com/product?_wx_tpl=https%3A%2F%2Fh5.m.taobao.com%2Ftrip%2Fweex-ui%2Fdemo%2Findex.native-min.js"
        config["app://root/tab2"] = "https://m.jyc99.com/discover"
        config["app://root/tab3"] = "https://m.jyc99.com/mine"
    }
    func processURLActionRequest(_ request: BHURLActionRequest) -> BHURLActionResponse? {
        if let rewirte = config[request.url.schemehostpath], let rewirteUrl = URL(string: rewirte) {
            let response = BHURLActionResponse(asNone: ())
            response.responseType = .redirect
            var url = rewirteUrl
            // req有query
            if let oriQuery = request.url.query {
                let sep = (rewirteUrl.query == nil ? "?" : "&") //? 还是 &
                if let redirectURL = URL(string: rewirteUrl.absoluteString + sep + oriQuery) {
                    url = redirectURL
                }
            }
            response.redirectURL = url
            return response
        }
        return nil
    }

}
