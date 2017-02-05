//
//  QQAddContactViewController.m
//  04-纯代码QQ框架
//
//  Created by HM09 on 17/2/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "QQAddContactViewController.h"

@interface QQAddContactViewController ()

@end

@implementation QQAddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

-(void)setupUI{
    
    //创建tableView
    UITableView *tb = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    //设置数据源对象
    
    
    //注册cell
    
    //tableView添加到根视图
    [self.view addSubview:tb];
}



@end
