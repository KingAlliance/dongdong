//
//  SQSecondCell.h
//  动动
//
//  Created by ilsxl13 on 2016/10/24.
//  Copyright © 2016年 tad23. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SQSecondCellDelegate <NSObject>

- (NSInteger)numberOfItem;

- (UICollectionViewCell*)tableViewCell:(UITableViewCell*)tableViewCell cellForItemAtIndex:(NSInteger)index;

@end


@interface SQSecondCell : UITableViewCell <UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>
@property (nonatomic, weak) id<SQSecondCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionview;

@end
