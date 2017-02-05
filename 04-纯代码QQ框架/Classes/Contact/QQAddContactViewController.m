//
//  QQAddContactViewController.m
//  04-纯代码QQ框架
//
//  Created by HM09 on 17/2/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "QQAddContactViewController.h"

static NSString *rid = @"new";

@interface QQAddContactViewController () <UITableViewDataSource>

@end

@implementation QQAddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

#pragma mark - 实现数据源方法
//返回组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
}

//返回行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

//返回单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //获取cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rid forIndexPath:indexPath];
    
    //给cell赋值
    cell.textLabel.text = @"扫一扫";
    cell.imageView.image = [UIImage imageNamed:@"found_icons_saosao"];
    
    //返回cell
    return cell;
}

-(void)setupUI{
    
    //创建tableView
    UITableView *tb = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    //设置数据源对象
    tb.dataSource = self;
    
    //注册cell
    [tb registerClass:[UITableViewCell class] forCellReuseIdentifier:rid];
    
    //tableView添加到根视图
    [self.view addSubview:tb];
}



@end
