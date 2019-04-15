//
//  oc-swift-header.h
//  jycapp
//
//  Created by yaochenfeng on 2018/9/18.
//  Copyright © 2018年 cn.bestws.app. All rights reserved.
//

#ifndef oc_swift_header_h
#define oc_swift_header_h
#import <CocoaLumberjack/CocoaLumberjack.h>
#import <SAMKeychain/SAMKeychain.h>
#ifndef SwiftLogLevel_h
#define SwiftLogLevel_h

#ifndef DD_LOG_LEVEL
// #warning 'DD_LOG_LEVEL' is not defined. Using 'DDLogLevelAll' as default. Consider defining it yourself.
#define DD_LOG_LEVEL DDLogLevelAll
#endif
static const DDLogLevel DDDefaultLogLevel = DD_LOG_LEVEL;

//项目文件
#import "BeeUtils.h"
#endif /* SwiftLogLevel_h */
#endif /* oc_swift_header_h */
