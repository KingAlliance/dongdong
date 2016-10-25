//
//  SQSecondCell.m
//  动动
//
//  Created by ilsxl13 on 2016/10/24.
//  Copyright © 2016年 tad23. All rights reserved.
//

#import "SQSecondCell.h"

@implementation SQSecondCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        self.collectionview = [[UICollectionView alloc] initWithFrame:CGRectNull collectionViewLayout:layout];
        [self addSubview:self.collectionview];
        self.collectionview.pagingEnabled = YES;
        self.collectionview.backgroundColor = [UIColor clearColor];
        self.collectionview.showsHorizontalScrollIndicator = NO;
        [self.collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(0);
            make.height.equalTo(200);
        }];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(self.bounds.size.width - 5 * 2, 200);
        layout.minimumInteritemSpacing = 10;
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
        self.collectionview.delegate = self;
        self.collectionview.dataSource = self;
        [self.collectionview registerNib:[UINib nibWithNibName:@"SQCollectionViewCell1" bundle:nil] forCellWithReuseIdentifier:@"SQCollectionViewCell1"];
        [self.collectionview registerNib:[UINib nibWithNibName:@"SQCollectionViewCell2" bundle:nil] forCellWithReuseIdentifier:@"SQCollectionViewCell2"];
        [self.collectionview registerNib:[UINib nibWithNibName:@"SQCollectionViewCell3" bundle:nil] forCellWithReuseIdentifier:@"SQCollectionViewCell3"];
    }
    return self;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.delegate numberOfItem];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.delegate tableViewCell:self cellForItemAtIndex:indexPath.row];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = lrintf(scrollView.contentOffset.x / scrollView.width);
    // 设置页码
    self.pageControl.currentPage = page;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
