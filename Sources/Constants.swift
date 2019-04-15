//
//  Constants.swift
//  finance
//
//  Created by 姚晨峰 on 2019/4/11.
//  Copyright © 2019 jyc99. All rights reserved.
//

import UIKit
struct Constants {
    /// 设备宽高
    static let screenwidth = UIScreen.main.bounds.width
    static let screenheight = UIScreen.main.bounds.height
    // swiftlint:disable colon force_cast
    static let bundle:String = Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String
    static let version:String = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
    static let build:String = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    // swiftlint:enable colon force_cast
    /// 设备号
    static let deviceId: String = {
        return BeeUtils.uuid()
    }()
}
