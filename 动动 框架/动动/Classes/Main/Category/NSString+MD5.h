//
//  NSString+MD5.h
//  Day04_Homework
//
//  Created by tarena on 16/9/5.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)
//新增计算属性：计算出md5值，注意:category规定只能添加方法，因为计算属性的本质就是方法，所以才能添加，不允许写存储属性
//计算属性就是只有get 没有set的属性, 所以写readonly
@property(nonatomic,readonly)NSString *md5String;
@end
