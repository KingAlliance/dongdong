//
//  UIColor+Extension.m
//  HemoWork
//
//  Created by tarena on 16/8/18.
//  Copyright © 2016年 tarena. All rights reserved.
//
//类库
#import "UIColor+Extension.h"

@implementation UIColor (Extension)
+(instancetype)colorWith255Red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(NSInteger)alpha {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0  alpha:alpha / 255.0];
}

+(instancetype)randomColor{
    CGFloat red = arc4random() % 256;
    CGFloat green = arc4random() % 256;
    CGFloat blue = arc4random() % 256;
    CGFloat alpha = arc4random() % 256;
    return [UIColor colorWith255Red:red green:green blue:blue alpha:alpha];
}


+(instancetype)colorWithHex:(NSInteger)hex {
    NSInteger alpha = (hex & 0xFF000000)>>24;
    NSInteger red = (hex & 0xFF0000)>>16;
    NSInteger green = (hex & 0xFF00)>>8;
    NSInteger blue = hex & 0xFF;
    return [UIColor colorWith255Red:red green:green blue:blue alpha:alpha];
}

+(instancetype)colorWithHexNoAlpha:(NSInteger)hex {
    NSInteger red = (hex & 0xFF0000)>>16;
    NSInteger green = (hex & 0xFF00)>>8;
    NSInteger blue = hex & 0xFF;
    return [UIColor colorWith255Red:red green:green blue:blue alpha:255];
}


@end








