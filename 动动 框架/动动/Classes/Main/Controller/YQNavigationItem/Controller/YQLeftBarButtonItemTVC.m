//
//  YQLeftBarButtonItemTVC.m
//  动动
//
//  Created by tarena on 2016/10/22.
//  Copyright © 2016年 tad23. All rights reserved.
//

#import "YQLeftBarButtonItemTVC.h"

@interface YQLeftBarButtonItemTVC ()

@end

@implementation YQLeftBarButtonItemTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    self.navigationItem.title = @"消息中心";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"imageArrowTemplate" highImageName:nil target:self action:@selector(back)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"imageMessageCenterSettingsIcon" highImageName:nil target:self action:@selector(setUp)];
}

- (void)setUp{

}

- (void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuseIdentifier"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.textColor = [UIColor whiteColor];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"点赞";
            cell.imageView.image = [UIImage imageNamed:@"imageMessageCenterSystemMessageIconLikes"];
            break;
        case 1:
            cell.textLabel.text = @"粉丝";
            cell.imageView.image = [UIImage imageNamed:@"imageMessageCenterSystemMessageIconFollowers"];
            break;
        case 2:
            cell.textLabel.text = @"评论";
            cell.imageView.image = [UIImage imageNamed:@"imageMessageCenterSystemMessageIconComments"];
            break;
        case 3:
            cell.textLabel.text = @"群组";
            cell.imageView.image = [UIImage imageNamed:@"imageMessageCenterSystemMessageIconGroups"];
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

@end
