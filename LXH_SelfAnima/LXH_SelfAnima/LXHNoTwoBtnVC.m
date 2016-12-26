//
//  LXHNoTwoBtnVC.m
//  LXH_SelfAnima
//
//  Created by moxuyou on 16/6/16.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "LXHNoTwoBtnVC.h"
#import "LXHNoTwoBtnVcCell.h"
#import "LXHNoTwoBtnVcCellItem.h"

#define CellID @"NoTwoBtnCell"
@interface LXHNoTwoBtnVC ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic , strong)NSArray *datdaArray;

@end

@implementation LXHNoTwoBtnVC

//懒加载创建数据
-(NSArray *)datdaArray{
    if(!_datdaArray){
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in self.items) {
            LXHNoTwoBtnVcCellItem *item = [LXHNoTwoBtnVcCellItem NoTwoBtnVcCellItemWithDict:dict];
            
            [arrayM addObject:item];
        }
        _datdaArray = arrayM;
    }
    return _datdaArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //控制转场动画下拉tableView的显示数据
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, -10, 100, self.items.count * 44);
    [self.view addSubview:imageView];
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.backgroundColor = [UIColor darkGrayColor];
    tableView.frame = CGRectMake(0, 0, 100, self.items.count * 44);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    tableView.layer.cornerRadius = 5;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    //    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellID];
}

/** */
#pragma mark - UITableDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datdaArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LXHNoTwoBtnVcCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell == nil) {
        cell = [LXHNoTwoBtnVcCell NoTwoBtnVcCell];
    }
    cell.backgroundColor = [UIColor darkGrayColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    LXHNoTwoBtnVcCellItem *item = self.datdaArray[indexPath.row];
    cell.item = item;
    
    return cell;
}

#pragma mark - UITableDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"选中了第%lu行", indexPath.row);
    //    NSDictionary *dict = @{@"num" : [NSString stringWithFormat:@"%lu", indexPath.row]};
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"searchTypePose" object:dict];
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
