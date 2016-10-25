//
//  YQProfileTVC.m
//  动动
//
//  Created by tarena on 2016/10/20.
//  Copyright © 2016年 tad23. All rights reserved.
//

#import "YQProfileTVC.h"
#import "SQFirstCell.h"
#import "SQSecondCell.h"
#import "SQFourthCell.h"
#import "SQCollectionViewCell1.h"
#import "SQCollectionViewCell2.h"
#import "SQCollectionViewCell3.h"

@interface YQProfileTVC () <SQSecondCellDelegate>
@property (nonatomic, strong) SQCollectionViewCell1 *item;
@end

@implementation YQProfileTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorWithRed:0.14080232381820679 green:0.15284916758537292 blue:0.16120061278343201 alpha:1];
    self.tableView.tableHeaderView = [UIView new];
    
    
    self.navigationItem.title = @"我";
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:1 animations:^{
//        self.item.widthConstraint.constant = 100;
//        [self.item layoutIfNeeded];
        CGRect rect = self.item.yellowView.frame;
        rect.size.width = 100;
        self.item.yellowView.frame = rect;
    } completion:^(BOOL finished) {
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.separatorInset = UIEdgeInsetsZero;
    tableView.layoutMargins = UIEdgeInsetsZero;
    tableView.preservesSuperviewLayoutMargins = NO;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [UIView new];
    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *view = [UIView new];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
        return 80;
    else if (indexPath.section == 1)
        return 240;
    else if (indexPath.section == 2)
        return 100;
    else if (indexPath.section == 3)
        return 50;
    return 100;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0)
        return 1;
    else if (section == 1)
        return 2;
    else if (section == 2)
        return 1;
    else if (section == 3)
        return 1;
    else
        return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        SQFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
        cell.headImage.image = [UIImage imageNamed:@"03093107837040"];
        cell.headImage.clipsToBounds = YES;
        return cell;
    }
    else if (indexPath.section == 1 && indexPath.row == 0)
    {
        SQSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:@"secondCell"];
        cell.pageControl.custom_currentImage = [UIImage imageNamed:@"dd_goalCheckinIndicatorChecked"];
        cell.pageControl.custom_defaultImage = [UIImage imageNamed:@"bottom_bar_origin_normal"];
        cell.pageControl.custom_pageSize = CGSizeMake(5, 5);
        cell.delegate = self;
        return cell;
    }
    else if (indexPath.section == 1 && indexPath.row == 1)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"thirdCell"];
        return cell;
    }
    else if (indexPath.section == 2)
    {
        SQFourthCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fourthCell"];
        return cell;
    }
    else if (indexPath.section == 3)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fifthCell"];
        return cell;
    }
    return nil;
}



- (NSInteger)numberOfItem
{
    return 3;
}

- (UICollectionViewCell *)tableViewCell:(UITableViewCell*)tableViewCell cellForItemAtIndex:(NSInteger)index
{
    if (index == 0) {
        SQCollectionViewCell1 *item = [((SQSecondCell *)tableViewCell).collectionview dequeueReusableCellWithReuseIdentifier:@"SQCollectionViewCell1" forIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
        self.item = item;
        return item;
    }
    else if (index == 1)
    {
        SQCollectionViewCell2 *item = [((SQSecondCell *)tableViewCell).collectionview dequeueReusableCellWithReuseIdentifier:@"SQCollectionViewCell2" forIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
        return item;
    }
    else
    {
        SQCollectionViewCell3 *item = [((SQSecondCell *)tableViewCell).collectionview dequeueReusableCellWithReuseIdentifier:@"SQCollectionViewCell3" forIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
        return item;
    }
}




@end
