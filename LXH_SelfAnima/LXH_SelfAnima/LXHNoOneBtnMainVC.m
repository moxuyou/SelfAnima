//
//  LXHNoOneBtnMainVC.m
//  LXH_SelfAnima
//
//  Created by moxuyou on 16/6/16.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "LXHNoOneBtnMainVC.h"

#define CellID @"NoOneBtnCell"
@interface LXHNoOneBtnMainVC ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation LXHNoOneBtnMainVC

//懒加载创建数据
-(NSArray *)items{
    if(!_items){
        _items = [NSArray array];
    }
    return _items;
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
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
//    tableView.layer.cornerRadius = 5;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
}

/** */
#pragma mark - UITableDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = self.items[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellID];
    }
    cell.backgroundColor = [UIColor darkGrayColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    //控制cell之间的线显示
    if(indexPath.row != 0){
        
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(2, 0, self.view.bounds.size.width - 4, 1);
        view.backgroundColor = [UIColor colorWithWhite:0.25 alpha:1];
        [cell addSubview:view];
    }
    if(dict[@"image"] != nil){
        cell.imageView.image = [UIImage imageNamed:dict[@"image"]];
    }
    if(dict[@"text"] != nil){
        cell.textLabel.text = dict[@"text"];
    }

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
