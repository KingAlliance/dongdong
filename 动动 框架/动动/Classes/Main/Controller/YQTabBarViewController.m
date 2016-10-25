//
//  YQTabBarViewController.m
//  动动
//
//  Created by tarena on 2016/10/18.
//  Copyright © 2016年 tad23. All rights reserved.
//

#import "YQTabBarViewController.h"
#import "YQProfileTVC.h"
#import "YQAnalyseTVC.h"
#import "YQRunVC.h"
#import "YQTargetTVC.h"
#import "YQGroupTVC.h"
#import "YQNavigationController.h"

@interface YQTabBarViewController () 

@end

@implementation YQTabBarViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 添加所有的子控制器
    [self addAllChildVcs];
    
}

/**
 *  添加所有的子控制器
 */
- (void)addAllChildVcs
{
    UIStoryboard *pfStoryboard = [UIStoryboard storyboardWithName:@"YQProfile" bundle:nil];
    YQProfileTVC *profile = (YQProfileTVC*)[pfStoryboard instantiateInitialViewController];
    [self addOneChlildVc:profile title:@"我" imageName:@"dd_ImgTabBarMe" selectedImageName:@"dd_ImgTabBarMeSelected"];
    YQAnalyseTVC *analyse = [[YQAnalyseTVC alloc] init];
    [self addOneChlildVc:analyse title:@"分析" imageName:@"dd_ImgTabBarTrend" selectedImageName:@"dd_ImgTabBarTrendSelected"];
    YQRunVC *run = [[YQRunVC alloc] init];
    [self addOneChlildVc:run title:@"" imageName:@"dd_ImgTabBarActivity" selectedImageName:@"dd_ImgTabBarActivitySelected"];
    YQTargetTVC *target = [[YQTargetTVC alloc] init];
    [self addOneChlildVc:target title:@"目标" imageName:@"dd_imgTabBarGoalwhite" selectedImageName:@"dd_imgTabBarGoalyellow"];
    YQGroupTVC *group = [[YQGroupTVC alloc] init];
    [self addOneChlildVc:group title:@"群组" imageName:@"dd_ImgTabBarSocial" selectedImageName:@"dd_ImgTabBarSocialSelected"];
}

/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */

- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    // 设置标题
    childVc.title = title;
    
    // 设置背景颜色
//    childVc.view.backgroundColor = YQBlackColor;
    
    // 设置普通图标
    childVc.tabBarItem.image = [UIImage imageWithMode:imageName];
    
    // 设置选中的图标
    childVc.tabBarItem.selectedImage = [UIImage imageWithMode:selectedImageName];
    
    //设置tabBar文字垂直和水平位置
    [childVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    
    // 设置tabBarItem的普通文字颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: YQOrangeColor} forState:UIControlStateSelected];
    
    // 添加为tabbar控制器的子控制器

    YQNavigationController *nav = [[YQNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

@end
