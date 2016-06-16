//
//  LXHUIPresentationController.m
//  LXH_SelfAnima
//
//  Created by moxuyou on 16/6/16.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "LXHUIPresentationController.h"
#import "LXHNoOneBtnMainVC.h"

@interface LXHUIPresentationController ()<UIGestureRecognizerDelegate>

@end
@implementation LXHUIPresentationController

- (void)containerViewWillLayoutSubviews{
    self.containerView.backgroundColor = [UIColor colorWithWhite:0.25 alpha:0.3];
    self.presentedView.bounds = CGRectMake(0, 0, self.presentedFrame.size.width, self.presentedFrame.size.height);
    self.presentedView.layer.anchorPoint = CGPointMake(0, 0);
    self.presentedView.layer.position = CGPointMake(self.presentedFrame.origin.x, self.presentedFrame.origin.y);
}

- (void)presentationTransitionWillBegin{
    [self.containerView addSubview:self.presentedView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    tap.delegate = self;
    [self.containerView addGestureRecognizer:tap];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed{
    [self.presentedView removeFromSuperview];
}

-(void)tap:(UITapGestureRecognizer *)tap{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    CGPoint point = [touch locationInView:self.containerView];
    if(CGRectContainsPoint(self.presentedView.frame, point)){
        return NO;
    }
    return YES;
}


@end
