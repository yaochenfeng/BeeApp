//
//  BeeUtils.m
//  beeApp
//
//  Created by 姚晨峰 on 2019/4/15.
//  Copyright © 2019 jyc99. All rights reserved.
//

#import "BeeUtils.h"
#import <Bugly/Bugly.h>
@implementation BeeUtils
+(NSString *)uuid{
    return [Bugly buglyDeviceId];
}
@end
