//
//  QQZoneViewController.m
//  04-纯代码QQ框架
//
//  Created by HM09 on 17/2/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "QQZoneViewController.h"

@interface QQZoneViewController ()

@end

@implementation QQZoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    //加载数据的方法
    [self loadDataWithPlistName:@"QQZone.plist"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
