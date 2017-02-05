//
//  QQAboutViewController.m
//  04-纯代码QQ框架
//
//  Created by HM09 on 17/2/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "QQAboutViewController.h"
#import "Masonry.h"

@interface QQAboutViewController ()

@end

@implementation QQAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self loadDataWithPlistName:@"functionAbout.plist"];
    
    [self setHeader];
}

-(void)setHeader{
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 150)];
    
    
    //创建imageView
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"setting_about_pic"]];
    
    [headerView addSubview:iv];
    
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(headerView);
        make.top.equalTo(headerView).offset(8);
        
    }];
    
    //创建版本label
    UILabel *lbl = [UILabel new];
    
    lbl.text = @"V4.8.1001";
    
    [headerView addSubview:lbl];

    [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(headerView);
        make.top.equalTo(iv.mas_bottom).offset(8);
    }];
    
    
    //访问tableView
    self.tableView.tableHeaderView = headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
