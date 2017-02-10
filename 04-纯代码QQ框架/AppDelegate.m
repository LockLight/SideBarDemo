//
//  AppDelegate.m
//  04-纯代码QQ框架
//
//  Created by HM09 on 17/2/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "AppDelegate.h"
#import "QQMainViewController.h"
#import "QQSideBarViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    //实例化window
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    
    //设置window的根控制器
    _window.rootViewController = [[QQSideBarViewController alloc] init];
    
    //让window可见
    [_window makeKeyAndVisible];
    
    return YES;
}



@end
