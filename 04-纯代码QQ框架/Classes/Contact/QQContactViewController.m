//
//  QQContactViewController.m
//  04-纯代码QQ框架
//
//  Created by HM09 on 17/2/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "QQContactViewController.h"


static NSString *rid = @"contact";

@interface QQContactViewController () <UITableViewDataSource>


@property (nonatomic,weak)UISegmentedControl *segmentCtrl;

@property (nonatomic,weak)UITableView *tableView;

@end

@implementation QQContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return (_segmentCtrl.selectedSegmentIndex + 1) * 10; //第0个选项 10行  第1个选项20行  (索引+1) * 10
}

//返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //取cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rid forIndexPath:indexPath];
    
    //给cell赋值
    cell.textLabel.text = @(indexPath.row).description;
    
    //返回cell
    return cell;
}

-(void)setupUI{
    
    //创建tableView
    UITableView *tb = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    //设置tableView数据源对象
    tb.dataSource = self;
    
    //注册cell
    [tb registerClass:[UITableViewCell class] forCellReuseIdentifier:rid];
    
    //把tableView添加到根视图
    [self.view addSubview:tb];
    
    //创建分段控件
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:@[@"分组",@"全部"]];
    
    //设置所有选项卡的宽度
    for (NSInteger i = 0; i < seg.numberOfSegments; i++) {
        
        [seg setWidth:65 forSegmentAtIndex:i];
    }
    
    //设置默认被选中的分段
    seg.selectedSegmentIndex = 0;

    
    //监听分段控件的事件
    [seg addTarget:self action:@selector(changeSegment:) forControlEvents:UIControlEventValueChanged];
    
    //让分段控件显示在导航条上
    self.navigationItem.titleView = seg;
    
    //记录分段控件
    _segmentCtrl = seg;
    //记录tableView
    _tableView = tb;
}

//当分段控件被选中时触发的方法
-(void)changeSegment:(UISegmentedControl *)seg{
    
    //NSLog(@"%zd",seg.selectedSegmentIndex);
    //刷新tableView
    [_tableView reloadData]; //刷新tableView
}



@end
