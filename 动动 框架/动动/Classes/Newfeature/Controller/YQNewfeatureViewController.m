//
//  YQNewfeatureViewController.m
//  动动
//
//  Created by tarena on 2016/10/18.
//  Copyright © 2016年 tad23. All rights reserved.
//
#define YQNewfeatureImageCount 2


#import "YQNewfeatureViewController.h"
#import "YQTabBarViewController.h"
#import "UIPageControl+Custom.h"

@interface YQNewfeatureViewController () <UIScrollViewDelegate>
@property (nonatomic) UIPageControl *pageControl;

@end

@implementation YQNewfeatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    // 添加背景图片
    [self setupBackgroundImage];
    
    // 添加UISrollView
    [self setupScrollView];
    
    // 添加pageControl
    [self setupPageControl];
}
/**
 *  添加背景图片
 */
- (void)setupBackgroundImage{
    UIImageView *backImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dd_tutorial_background"]];
    
    //默认iPhone6P:  736
    //    UIImage *image = [UIImage imageNamed:@"dd_tutorial_background"];
    //    UIImageView *backImage = [[UIImageView alloc]initWithImage:image];
    //    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    //    if (height == 480) {//iPhone4:   480
    //        image = [UIImage imageNamed:@"dd_tutorial_background_small"];
    //    }
    //    if (height == 568) {//iPhone5:   568
    //        image = [UIImage imageNamed:@"dd_tutorial_background"];
    //    }
    //    if (height == 667) {//iPhone6:   667
    //        image = [UIImage imageNamed:@"dd_tutorial_background"];
    //    }
    
    
    [self.view addSubview:backImage];
    [backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
}

/**
 *  添加UISrollView
 */
- (void)setupScrollView
{
    UIScrollView *sv = [UIScrollView new];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    sv.delegate = self;
    UIView *lastView = nil;
    for (int i = 0; i < YQNewfeatureImageCount; i++) {
        UIImageView *iv = [UIImageView new];
        [sv addSubview:iv];
        //图片视图 如果是代码创建的，默认是不开用户交互的，即它的本身以及所有子视图都不接受用户交互
        iv.userInteractionEnabled = YES;
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(sv);
            make.top.bottom.equalTo(0);
            if (i == 0) {
                make.left.equalTo(0);
            }else {
                make.left.equalTo(lastView.mas_right);
                if (i == YQNewfeatureImageCount - 1) {
                    make.right.equalTo(0);
                }
            }
        }];
        lastView = iv;
        //设置欢迎界面图标
        [self addIcon:iv i:i];
    }
    sv.pagingEnabled = YES;//翻页滚动
    sv.bounces = NO;//弹性取消
    sv.showsHorizontalScrollIndicator = NO;//取消水平滚动条
}

/**
 *  添加pageControl
 */
- (void)setupPageControl
{
    // 1.添加
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.numberOfPages = YQNewfeatureImageCount;
    //使用runtime的关联对象为系统的UIPageControll添加两个属性，分别表示当前的小圆点显示的图片和默认显示的图片
    _pageControl.custom_currentImage = [UIImage imageNamed:@"detail_tupianlunbo_suiji"];
    
//    NSMutableArray *allImages = [[NSMutableArray alloc]init];
//    for (int i = 0; i < 6; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%02d",@"animation",i+1]];
//        [allImages addObject:image];
//    }
//    _pageControl.custom_currentAnimationImages = [allImages copy];
//    _pageControl.custom_currentAnimationSpeed = 1 / 6;
    
    _pageControl.custom_defaultImage = [UIImage imageNamed:@"detail_piclunbounselec_suiji"];
    [self.view addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.bottom.equalTo(-20);
    }];
    // 2.设置圆点的颜色
//    _pageControl.currentPageIndicatorTintColor = YQOrangeColor; // 当前页的小圆点颜色
//    _pageControl.pageIndicatorTintColor = HMColor(189, 189, 189); // 非当前页的小圆点颜色
    
}

/**
 *  设置欢迎界面图标
 *
 *  @param iv 欢迎界面图片
 *  @param i  欢迎界面页数
 */
- (void)addIcon:(UIImageView *)iv i:(NSInteger)i{
    if (i == 0) {
        UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tutorial_dongdong_icon"]];
        [iv addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(142);
        }];
        
        UILabel *label1 = [UILabel new];
        [iv addSubview:label1];
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(icon.mas_bottom).equalTo(65);
        }];
        label1.textColor = YQOrangeColor;
        label1.font = [UIFont systemFontOfSize:24];
        label1.text = @"欢迎使用";
        label1.textAlignment = NSTextAlignmentCenter;
        
        UILabel *label2 = [UILabel new];
        [iv addSubview:label2];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(label1.mas_bottom).equalTo(13);
            make.width.equalTo(183);
        }];
        label2.textColor = [UIColor whiteColor];
        label2.numberOfLines = 2;
        label2.font = [UIFont systemFontOfSize:16];
        label2.text = @"带上动动一起享受全新的活力健康生活方式！";
        label2.textAlignment = NSTextAlignmentCenter;
        
        
    }
    
    if (i == YQNewfeatureImageCount - 1) {
        UIImageView *icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dd_tutorial_settings_with_perdometer"]];
        [iv addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(131);
        }];
        
        UILabel *label1 = [UILabel new];
        [iv addSubview:label1];
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(icon.mas_top).equalTo(-35);
        }];
        label1.textColor = [UIColor whiteColor];
        //            label1.font = [UIFont systemFontOfSize:24];
        label1.text = @"温馨提示";
        label1.textAlignment = NSTextAlignmentCenter;
        
        UILabel *label2 = [UILabel new];
        [iv addSubview:label2];
        [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(icon.mas_bottom).equalTo(33);
            make.width.equalTo(140);
        }];
        label2.textColor = YQOrangeColor;
        label2.numberOfLines = 2;
        label2.font = [UIFont systemFontOfSize:19];
        label2.text = @"开启运动记录并允许发送通知";
        label2.textAlignment = NSTextAlignmentCenter;
        
        UILabel *label3 = [UILabel new];
        [iv addSubview:label3];
        [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.top.equalTo(label2.mas_bottom).equalTo(10);
            make.width.equalTo(213);
        }];
        label3.textColor = [UIColor whiteColor];
        label3.numberOfLines = 2;
        label3.font = [UIFont systemFontOfSize:16];
        label3.text = @"让我们能够记录您的运动轨迹并及时告知您的运动成果";
        label3.textAlignment = NSTextAlignmentCenter;
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [iv addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label3.mas_bottom).equalTo(60);
            make.left.equalTo(40);
            make.height.equalTo(43);
            make.centerX.equalTo(0);
        }];
        btn.layer.borderWidth = 2;
        btn.layer.borderColor = YQOrangeColor.CGColor;
        btn.layer.cornerRadius = 3;
        [btn setTitleColor:YQOrangeColor forState:UIControlStateNormal];
        [btn setTitle:@"开始体验" forState:UIControlStateNormal];
        
        [btn addTarget:self action:@selector(clickedStart) forControlEvents:UIControlEventTouchUpInside];
    }

}

/**
 *  开始主界面
 */
- (void)clickedStart
{
    // 显示主控制器（HMTabBarController）
    YQTabBarViewController *vc = [[YQTabBarViewController alloc] init];
    
    // 切换控制器
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = vc;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 获得页码
    NSInteger page = lrintf(scrollView.contentOffset.x / scrollView.width);
    // 设置页码
    _pageControl.currentPage = page;
}

- (void)dealloc
{
    NSLog(@"dealloc-------");
}

@end
