//
//  QQAddContactViewController.m
//  04-纯代码QQ框架
//
//  Created by HM09 on 17/2/5.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "QQBaseFunctionViewController.h"
#import "QQFunctionModel.h"

static NSString *rid = @"new";

@interface QQBaseFunctionViewController () <UITableViewDataSource>

@end

@implementation QQBaseFunctionViewController{
    
    NSArray<NSArray *> *_modelList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];

}

//为了让子类继承这个类的时候，数据不会写死，那么这里的plist文件也不能写死，必须让子类自己传
-(void)loadDataWithPlistName:(NSString *)plistName{
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:plistName withExtension:nil];
    
    //根据plist文件读取出数组
    NSArray *arrayAll = [NSArray arrayWithContentsOfURL:url];
    
    
    //保存所有转换模型后的组数据的数组
    NSMutableArray *arrayM = [NSMutableArray array];
    
    //遍历每个元素（组数据元素）
    for (NSArray *dictArr in arrayAll) {
        
        //dictArr里面的元素就是字典了
        NSMutableArray *modelArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArr) {
            
            //做字典转模型
            QQFunctionModel *model = [QQFunctionModel new];
            
            [model setValuesForKeysWithDictionary:dict];
            
            [modelArray addObject:model];
        }
        //上面这个循环走完，就代表modelArray里面保存了某一组的所有数据
        //把当前这一组转换完的组数据，添加到保存所有组数据的数组中
        [arrayM addObject:modelArray];
    }
    
    //让属性记录数据
    _modelList = arrayM.copy;
}

#pragma mark - 实现数据源方法
//返回组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return _modelList.count;
}

//返回行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //先取出组数据
    NSArray *sectionArr = _modelList[section];
    
    //这一组数据长度为几就代表几行
    return sectionArr.count;
}

//返回单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //取出模型数据
    
    //先根据组索引取出组数据
    NSArray *sectionArr = _modelList[indexPath.section];
    
    //根据行索引，取出这一组数据里的某一行数据
    QQFunctionModel *model = sectionArr[indexPath.row];
    
    
    //获取cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rid forIndexPath:indexPath];
    
    //给cell赋值
    cell.textLabel.text = model.name;
    cell.imageView.image = [UIImage imageNamed:model.icon];
    
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
