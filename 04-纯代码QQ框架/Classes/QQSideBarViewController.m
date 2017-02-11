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
@property (nonatomic, weak) QQMainViewController *containVC;

@property (nonatomic, weak) UIView *containView;
@property (nonatomic, weak) UITapGestureRecognizer *tapBack;

@end

@implementation QQSideBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor yellowColor];
    //添加push按钮
    [self setupPushBtn];
    //添加容器控制器
    [self addContainerView];
    //添加拖拽手势
    [self setupPanGesture];
}

#pragma mark 添加容器视图
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
    
    //赋值给属性
    _containView = vc.view;
    _containVC = vc;
}


#pragma mark 添加拖拽手势
- (void)setupPanGesture{
    //实例化手势识别器
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
    //手势添加到指定视图
    [self.view addGestureRecognizer:pan];
}

- (void)panGesture:(UIPanGestureRecognizer *)pan{
    //获取当前手势偏移量
    CGPoint offset = [pan translationInView:self.view];
    //手势复位
    [pan setTranslation:CGPointZero inView:self.view];
    //避免拖拽出右侧边界
    if(_containView.frame.origin.x + offset.x < 0){
        _containView.transform = CGAffineTransformIdentity;
        return;
    }
    
    //根据当前手势状态设置容器视图形变
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:{
            _containView.transform = CGAffineTransformTranslate(_containView.transform, offset.x, 0);
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:{
            //侧滑完成后的固定悬停位置
            CGFloat offsetX = self.view.bounds.size.width - 64;
            //拖拽宽度超过一半时显示侧边栏
            if(_containView.frame.origin.x > self.view.bounds.size.width * 0.5){
                [self showSideBarWithOffset:offsetX];
            }else{
            //关闭侧边栏
                [self closeSideBar];
            }
        }
        default:
            break;
    }
}

//点按返回主页面
- (void)tapBackToMain:(UITapGestureRecognizer *)tapBackToMain{
    [self closeSideBar];
}

//显示侧边栏
- (void)showSideBarWithOffset:(CGFloat)offsetX{
    [UIView animateWithDuration:0.4 animations:^{
        _containView.transform =  CGAffineTransformMakeTranslation(offsetX, 0);
    }];
    //添加点按手势 实现返回功能
    UITapGestureRecognizer *tapBack = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBackToMain:)];
    //添加到容器控制器
    [_containView addGestureRecognizer:tapBack];
    
    //赋值给属性
    _tapBack = tapBack;
}

//关闭侧边栏
- (void)closeSideBar{
    [UIView animateWithDuration:0.4 animations:^{
        _containView.transform = CGAffineTransformIdentity;
    }];
    [_containView removeGestureRecognizer:_tapBack];
}

#pragma mark 添加push按钮
- (void)setupPushBtn{
    UIButton *pushBtn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    pushBtn.center = self.view.center;
    
    [self.view addSubview:pushBtn];
    
    [pushBtn addTarget:self action:@selector(clickPushBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickPushBtn:(UIButton *)pushBtn{
    //创建需要PUSH的控制器
    UIViewController *newVC = [[UIViewController alloc]init];
    newVC.view.backgroundColor = [UIColor purpleColor];
    
    //获取容器控制器
    QQMainViewController *containVC = (QQMainViewController *)self.containVC;
    //当前选中的导航控制器
    UINavigationController *nav = containVC.selectedViewController;
    [nav pushViewController:newVC animated:YES];
    
    //关闭侧边栏
    [self closeSideBar];
}


@end
