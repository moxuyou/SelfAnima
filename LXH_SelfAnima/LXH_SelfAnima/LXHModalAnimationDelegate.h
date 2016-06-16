//
//  LXHModalAnimationDelegate.h
//  LXH_SelfAnima
//
//  Created by moxuyou on 16/6/16.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXHModalAnimationDelegate : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL isPresented;

@end
