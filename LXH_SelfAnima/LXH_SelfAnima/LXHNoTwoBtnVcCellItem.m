//
//  LXHNoTwoBtnVcCellItem.m
//  LXH_SelfAnima
//
//  Created by moxuyou on 16/6/16.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "LXHNoTwoBtnVcCellItem.h"

@implementation LXHNoTwoBtnVcCellItem

+ (instancetype)NoTwoBtnVcCellItemWithDict:(NSDictionary *)dict
{
    LXHNoTwoBtnVcCellItem *item = [[LXHNoTwoBtnVcCellItem alloc] init];
    item.text = dict[@"text"];
    item.image = dict[@"image"];
    item.detailText = dict[@"detailText"];
    
    return item;
}

@end
