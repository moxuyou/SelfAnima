//
//  LXHNoTwoBtnVcCell.m
//  LXH_SelfAnima
//
//  Created by moxuyou on 16/6/16.
//  Copyright © 2016年 moxuyou. All rights reserved.
//

#import "LXHNoTwoBtnVcCell.h"
#import "LXHNoTwoBtnVcCellItem.h"

@interface LXHNoTwoBtnVcCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameLabelLeftConstraint;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *detailLabelLeftConstraint;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *littleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIView *footLineView;

@end
@implementation LXHNoTwoBtnVcCell

- (void)setItem:(LXHNoTwoBtnVcCellItem *)item
{
    _item = item;
    if (item.image != nil) {
        self.iconView.image = [UIImage imageNamed:item.image];
    }else{
        self.nameLabelLeftConstraint.constant -= 50;
        self.detailLabelLeftConstraint.constant -= 50;
    }
    if (item.text != nil) {
        self.nameLabel.text = item.text;
    }
    if (item.detailText != nil) {
        self.littleLabel.text = item.detailText;
    }
    
}

+ (instancetype)NoTwoBtnVcCell
{
    LXHNoTwoBtnVcCell *cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    
    return cell;
}

@end
