//
//  QQMainViewController.m
//  04-纯代码QQ框架
//
//  Created by HM09 on 17/2/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "QQMainViewController.h"
#import "QQMessageViewController.h"

@interface QQMainViewController ()

@end

@implementation QQMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控制器
    [self addControllers];
}

-(void)addControllers{
    
    
    UIViewController *vc1 = [self controllerWithClassName:@"QQMessageViewController" andTitle:@"消息" andImgName:@"tab_recent_nor"];
    
    UIViewController *vc2 = [self controllerWithClassName:@"QQContactViewController" andTitle:@"联系人" andImgName:@"tab_buddy_nor"];
    
    UIViewController *vc3 = [self controllerWithClassName:@"QQZoneViewController" andTitle:@"动态" andImgName:@"tab_qworld_nor"];
    
    UIViewController *vc4 = [self controllerWithClassName:@"QQSettingViewController" andTitle:@"设置" andImgName:@"tab_me_nor"];
    
    
    self.viewControllers = @[ vc1,vc2,vc3,vc4 ];
}


//封装思想：相同代码封装成一个方法
//不同的值，通过参数传递
-(UIViewController *)controllerWithClassName:(NSString *)clsName andTitle:(NSString *)title andImgName:(NSString *)imgName{
    
    Class cls = NSClassFromString(clsName);
    
    //下断言：
    //可以设定一个条件，如果不满足这个条件，那么就抛出异常，并且异常的原因输出的就是你写的话
    NSAssert( [cls isSubclassOfClass:[UIViewController class]]  , @"传入的类名不是合法的控制器类名");
    
    //父类指针可以指向任意的子类对象
    UIViewController *vc = [cls new];
    
    vc.title = title;
    
    //设置tabBar的标签图像
    vc.tabBarItem.image = [UIImage imageNamed:imgName];
    
    //包装navigationController
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    return nav;
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
