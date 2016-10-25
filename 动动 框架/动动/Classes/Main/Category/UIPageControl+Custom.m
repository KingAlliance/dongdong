//
//  UIPageControl+Custom.m
//  KTPageControlDemo
//
//  Created by ilsxl13 on 2016/10/20.
//  Copyright © 2016年 kirito_song. All rights reserved.
//

@import UIKit;
@import Foundation;
#import "UIPageControl+Custom.h"
#import <objc/objc-runtime.h>

@implementation UIPageControl (Custom)


- (UIImage*)custom_currentImage{
    return objc_getAssociatedObject(self, @selector(custom_currentImage));
}
- (void)setCustom_currentImage:(UIImage*)custom_currentImage{
    objc_setAssociatedObject(self, @selector(custom_currentImage), custom_currentImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (NSArray<UIImage *> *)custom_currentAnimationImages
{
    return objc_getAssociatedObject(self, @selector(custom_currentAnimationImages));
}
- (void)setCustom_currentAnimationImages:(NSArray<UIImage *> *)custom_currentAnimationImages
{
    objc_setAssociatedObject(self, @selector(custom_currentAnimationImages), custom_currentAnimationImages, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (CGFloat)custom_currentAnimationSpeed
{
    return [objc_getAssociatedObject(self, @selector(custom_currentAnimationSpeed)) floatValue];
}
- (void)setCustom_currentAnimationSpeed:(CGFloat)custom_currentAnimationSpeed
{
    objc_setAssociatedObject(self, @selector(custom_currentAnimationSpeed), @(custom_currentAnimationSpeed), OBJC_ASSOCIATION_ASSIGN);
}


- (UIImage*)custom_defaultImage{
    return objc_getAssociatedObject(self, @selector(custom_defaultImage));
}
- (void)setCustom_defaultImage:(UIImage*)custom_defaultImage{
    objc_setAssociatedObject(self, @selector(custom_defaultImage), custom_defaultImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (CGSize)custom_pageSize{
    return [objc_getAssociatedObject(self, @selector(custom_pageSize)) CGSizeValue];
}
- (void)setCustom_pageSize:(CGSize)custom_pageSize{
    objc_setAssociatedObject(self, @selector(custom_pageSize), [NSValue valueWithBytes:&custom_pageSize objCType:@encode(CGSize)], OBJC_ASSOCIATION_ASSIGN);
}

/**
 每个小圆点的尺寸属性，因为setter和getter方法只实现在.m文件中，所以相当于私有属性

 @return custom_size
 */
- (CGSize)custom_size{
    return [objc_getAssociatedObject(self, @selector(custom_pageSize)) CGSizeValue];
}


/**
 设置每个小圆点的尺寸属性

 @param custom_size custom_size
 */
- (void)setCustom_size:(CGSize)custom_size{
    objc_setAssociatedObject(self, @selector(custom_pageSize), [NSValue valueWithCGSize:custom_size], OBJC_ASSOCIATION_ASSIGN);
}



- (instancetype)initWithFrame:(CGRect)frame currentImage:(UIImage *)custom_currentImage andDefaultImage:(UIImage *)custom_defaultImage {
    
    self = [super initWithFrame:frame];
    self.custom_currentImage = custom_currentImage;
    self.custom_defaultImage = custom_defaultImage;
    return self;
}

- (instancetype)init {
    self = [super init];
    return self;
}

- (void)setUpDots
{
    
    if (self.custom_currentImage && self.custom_defaultImage) {
        self.custom_size = self.custom_currentImage.size;
    }
    else if (self.custom_currentAnimationImages && self.custom_defaultImage)
    {
        self.custom_size = CGSizeMake(20, 20);
    }
    else {
        self.custom_size = CGSizeMake(7, 7);
    }
    
    if (self.custom_pageSize.height && self.custom_pageSize.width) {
        self.custom_size = self.custom_pageSize;
    }
    
//    CGRect frame = self.frame;
//    frame.size.height = self.custom_size.height;
//    frame.size.width = self.custom_size.width * self.numberOfPages + (self.numberOfPages - 1) * 5;
//    self.frame = frame;
    
    //UIPageControl的subviews属性是根据numberOfPages的属性自动生成的，该数组的个数就等于numberOfPages的值
    for (int i = 0; i < [self.subviews count]; i++) {
        
        UIView* dot = [self.subviews objectAtIndex:i];
        
//        [dot setFrame:CGRectMake(i * (self.custom_size.width + 5), 0, self.custom_size.width, self.custom_size.height)];
//        NSLog(@"第%d个dot的frame为：%@",i,NSStringFromCGRect(dot.frame));
        
        
        [dot setFrame:CGRectMake(dot.center.x - self.custom_size.width * 0.5, dot.center.y - self.custom_size.height * 0.5, self.custom_size.width, self.custom_size.width)];
        if ([dot.subviews count] == 0) {
            UIImageView * view = [[UIImageView alloc]initWithFrame:dot.bounds];
            [dot addSubview:view];
        };
        UIImageView * view = dot.subviews[0];
        view.animationImages = nil;
        
        if (i == self.currentPage) {
            if (self.custom_currentImage) {
                view.image = self.custom_currentImage;
                dot.backgroundColor = [UIColor clearColor];
            }
            else if (self.custom_currentAnimationImages)
            {
                dot.backgroundColor = [UIColor clearColor];
                view.animationImages = self.custom_currentAnimationImages;
                view.animationDuration = self.custom_currentAnimationSpeed ? self.custom_currentAnimationSpeed * self.custom_currentAnimationImages.count : self.custom_currentAnimationImages.count * 0.1;
                view.animationRepeatCount = 0;
                [view startAnimating];
            }
            else {
                view.image = nil;
                dot.backgroundColor = self.currentPageIndicatorTintColor;
            }
        }else if (self.custom_defaultImage) {
            view.image = self.custom_defaultImage;
            dot.backgroundColor = [UIColor clearColor];
        }else {
            view.image = nil;
            dot.backgroundColor = self.pageIndicatorTintColor;
        }
    }
}


- (void)setCurrentPage:(NSInteger)page
{
    [self setValue:@(page) forKey:@"_currentPage"];
    [self setUpDots];
    
}


- (NSInteger)currentPage
{
    return [[self valueForKey:@"_currentPage"] integerValue];
}



@end
