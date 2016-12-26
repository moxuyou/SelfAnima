//
//  LXHNoTwoBtnVcCellItem.h
//  LXH_SelfAnima
//
//  Created by moxuyou on 16/6/16.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LXHNoTwoBtnVcCellItem : NSObject

@property (nonatomic , strong)NSString *text;
@property (nonatomic , strong)NSString *image;
@property (nonatomic , strong)NSString *detailText;

+ (instancetype)NoTwoBtnVcCellItemWithDict:(NSDictionary *)dict;

@end
