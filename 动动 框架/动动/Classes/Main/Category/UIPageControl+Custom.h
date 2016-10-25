//
//  UIPageControl+Custom.h
//  KTPageControlDemo
//
//  Created by ilsxl13 on 2016/10/20.
//  Copyright © 2016年 kirito_song. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPageControl (Custom)

//@property (nonatomic)   UIImage *custom_currentImage; //高亮图片
//@property (nonatomic,strong) NSArray<UIImage *> *custom_currentAnimationImages; //高亮时显示的动画
//@property (nonatomic)   UIImage *custom_defaultImage; //默认图片
//@property (nonatomic,assign)   CGSize custom_pageSize; //图标大小


/**
 高亮图片，属性名：custom_currentImage

 @return custom_currentImage
 */
- (UIImage*)custom_currentImage;
- (void)setCustom_currentImage:(UIImage*)custom_currentImage;


/**
 高亮时显示的动画的图片

 @return custom_currentAnimationImages
 */
- (NSArray<UIImage *> *)custom_currentAnimationImages;
- (void)setCustom_currentAnimationImages:(NSArray<UIImage *> *)custom_currentAnimationImages;



/**
 高亮时显示的动画的速度

 @return custom_currentAnimationSpeed
 */
- (CGFloat)custom_currentAnimationSpeed;
- (void)setCustom_currentAnimationSpeed:(CGFloat)custom_currentAnimationSpeed;


/**
 默认图片，属性名：custom_defaultImage

 @return custom_defaultImage
 */
- (UIImage*)custom_defaultImage;
- (void)setCustom_defaultImage:(UIImage*)custom_defaultImage;


/**
 图标大小，属性名：custom_pageSize

 @return custom_pageSize
 */
- (CGSize)custom_pageSize;
- (void)setCustom_pageSize:(CGSize)custom_pageSize;


- (instancetype)initWithFrame:(CGRect)frame currentImage:(UIImage *)custom_currentImage andDefaultImage:(UIImage *)custom_defaultImage;

@end
