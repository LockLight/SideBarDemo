//
//  QQSideBarViewController.m
//  04-纯代码QQ框架
//
//  Created by locklight on 17/2/10.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "QQSideBarViewController.h"
#import "QQMainViewController.h"

@interface QQSideBarViewController ()

@end

@implementation QQSideBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor orangeColor];
    //添加容器控制器
    [self addContainerView];
}

- (void)addContainerView{
    //创建容器控制器
    QQMainViewController *vc = [[QQMainViewController alloc]init];
    //添加到根控制器
    [self addChildViewController:vc];
    
    //设置容器控制器的视图大小
    vc.view.frame = self.view.bounds;
    
    //将容器视图添加到根视图
    [self.view addSubview:vc.view];
    
    //声明添加完成状态
    [vc didMoveToParentViewController:self];
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
