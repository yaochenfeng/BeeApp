//
//  BeeUtils.m
//  beeApp
//
//  Created by 姚晨峰 on 2019/4/15.
//  Copyright © 2019 jyc99. All rights reserved.
//

#import "BeeUtils.h"
#import <Bugly/Bugly.h>
#import <MBProgressHUD/MBProgressHUD.h>
@implementation BeeUtils
+(NSString *)uuid{
    return [Bugly buglyDeviceId];
}
+(void)show:(NSString *)msg{
    UIView *supv =  [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:supv animated:true];
    hub.label.text = msg;
    [hub hideAnimated:true afterDelay:1];
}
@end
