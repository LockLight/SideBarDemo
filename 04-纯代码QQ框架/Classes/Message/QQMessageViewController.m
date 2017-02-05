//
//  QQMessageViewController.m
//  04-纯代码QQ框架
//
//  Created by HM09 on 17/2/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "QQMessageViewController.h"

@interface QQMessageViewController ()

@end

@implementation QQMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

-(void)setupUI{
    
    //创建tableView,plain样式
    UITableView *tb = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    //tableView添加到根视图
    [self.view addSubview:tb];
    
    //设置右边的barButtonItem
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu_icon_bulb"] style:UIBarButtonItemStylePlain target:nil action:nil];
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
