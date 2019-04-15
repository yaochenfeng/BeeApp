//
//  WebURLResolver.swift
//  beeApp
//
//  Created by 姚晨峰 on 2019/4/15.
//  Copyright © 2019 jyc99. All rights reserved.
//

import UIKit

class ExceptionResponseMiddleware: NSObject, BHURLActionResponseMiddleware {
    func processURLActionResponse(_ responsse: BHURLActionResponse?, with request: BHURLActionRequest) -> BHURLActionResponse? {
        if responsse == nil, request.url.scheme == "https" || request.url.scheme == "http" {
            //处理打开网页情况
            let wvc = WebViewController(request.url)
            return BHURLActionResponse(viewController: wvc)
        }
        return responsse
    }
}
