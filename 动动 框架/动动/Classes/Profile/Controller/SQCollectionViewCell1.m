//
//  SQCollectionViewCell1.m
//  动动
//
//  Created by ilsxl13 on 2016/10/24.
//  Copyright © 2016年 tad23. All rights reserved.
//

#import "SQCollectionViewCell1.h"

@interface SQCollectionViewCell1 ()

@property (weak, nonatomic) IBOutlet UIView *lightgrayView;


@end

@implementation SQCollectionViewCell1

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.yellowView.layer.cornerRadius = 3;
        self.yellowView.clipsToBounds = YES;
        self.lightgrayView.layer.cornerRadius = 4;
        self.lightgrayView.clipsToBounds = YES;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
