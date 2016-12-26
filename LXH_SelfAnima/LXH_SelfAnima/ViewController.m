//
//  ViewController.m
//  LXH_SelfAnima
//
//  Created by moxuyou on 16/6/16.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "ViewController.h"
#import "LXHNoOneBtnMainVC.h"
#import "LXHModalAnimationDelegate.h"
#import "LXHUIPresentationController.h"
#import "LXHNoTwoBtnVC.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>
/**下拉tableView自定义Cell*/
@property (weak, nonatomic) IBOutlet UIButton *NoOneBtn;
@property (weak, nonatomic) IBOutlet UIButton *NoTwoBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**下拉tableView自定义Cell*/
- (IBAction)NoOneBtnClick {
    
    //设置
    LXHNoOneBtnMainVC *chatVc = [[LXHNoOneBtnMainVC alloc] init];
    chatVc.modalPresentationStyle = UIModalPresentationCustom;
    chatVc.transitioningDelegate = self;
//    [self addBgBlackView];
    //设置显示的数据，可以传输图片，文字字典text，图片字典image
    chatVc.items = @[@{@"text":@"搜全部" },
                     @{@"text":@"搜微博" },
                     @{@"text":@"搜人" }];
    [self presentViewController:chatVc animated:YES completion:nil];
    
}

//控制自定义转场动画的设置
#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    LXHModalAnimationDelegate *delegate = [[LXHModalAnimationDelegate alloc] init];
    delegate.isPresented = YES;
    return delegate;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    LXHModalAnimationDelegate *delegate = [[LXHModalAnimationDelegate alloc] init];
    delegate.isPresented = NO;
    return delegate;
}

//控制弹出下拉的frame
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    LXHUIPresentationController *presentation = [[LXHUIPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    CGFloat w = 100;
    CGFloat h = 44 * 3;
    CGFloat x = self.NoOneBtn.center.x;
    CGFloat y = CGRectGetMaxY(self.NoOneBtn.frame);
    presentation.presentedFrame = CGRectMake(x, y, w, h);
    return presentation;
}
- (IBAction)NoTwoBtnClick {
    //设置
    LXHNoTwoBtnVC *chatVc = [[LXHNoTwoBtnVC alloc] init];
    chatVc.modalPresentationStyle = UIModalPresentationCustom;
    chatVc.transitioningDelegate = self;
    //    [self addBgBlackView];
    //设置显示的数据，可以传输图片，文字字典text，图片字典image
    chatVc.items = @[@{@"text":@"搜全部" },
                     @{@"text":@"搜微博" },
                     @{@"text":@"搜人" }];
    [self presentViewController:chatVc animated:YES completion:nil];
}

@end
