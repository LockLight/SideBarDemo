//
//  QQSettingViewController.m
//  04-纯代码QQ框架
//
//  Created by HM09 on 17/2/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "QQSettingViewController.h"
#import "QQAboutViewController.h"

@interface QQSettingViewController ()

@end

@implementation QQSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadDataWithPlistName:@"QQSetting.plist"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//当选中某一行时会来触发
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //取消这一行的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    QQAboutViewController *vc = [QQAboutViewController new];
    
    vc.view.backgroundColor = [UIColor whiteColor];
    
    //隐藏底部栏
    vc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
