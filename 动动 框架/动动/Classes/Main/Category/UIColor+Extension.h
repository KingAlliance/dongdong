//
//  UIColor+Extension.h
//  HemoWork
//
//  Created by tarena on 16/8/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

+(instancetype)colorWith255Red:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(NSInteger)alpha;

/**
 *  随机颜色
 */
+(instancetype)randomColor;

/**
 *  十六进制颜色  0xFFFFFFFF 透明 红 绿 蓝
 */
+(instancetype)colorWithHex:(NSInteger)hex;

/**
 *  十六进制颜色  0xFFFFFF 红 绿 蓝
 */
+(instancetype)colorWithHexNoAlpha:(NSInteger)hex;


@end








