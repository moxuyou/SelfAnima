//
//  LXHModalAnimationDelegate.m
//  LXH_SelfAnima
//
//  Created by moxuyou on 16/6/16.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "LXHModalAnimationDelegate.h"

@implementation LXHModalAnimationDelegate

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    if(self.isPresented){
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        toView.alpha = 0;
        [UIView animateWithDuration:0.2 animations:^{
            toView.alpha = 1;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    else{
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        [UIView animateWithDuration:0.2 animations:^{
            fromView.alpha = 0;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}

@end
