//
//  QQBaseFunctionViewController.h
//  04-纯代码QQ框架
//
//  Created by HM09 on 17/2/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QQBaseFunctionViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

-(void)loadDataWithPlistName:(NSString *)plistName;


@property (nonatomic,weak)UITableView *tableView;

@end
