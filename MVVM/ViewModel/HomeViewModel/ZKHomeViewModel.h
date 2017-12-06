//
//  ZKHomeViewModel.h
//  MVVM
//
//  Created by Tom on 2017/12/1.
//  Copyright © 2017年 Tom. All rights reserved.
//

#import "ZKBaseViewModel.h"
#import "ZKHomeModel.h"

@interface ZKHomeViewModel : ZKBaseViewModel
@property (nonatomic, assign) NSInteger  rowNum;
@property (nonatomic, assign) NSInteger  page;
@property (nonatomic,   copy) NSString * updateTime;

- (NSURL *)iconURLForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)titleForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)praiseNumForIndexPath:(NSIndexPath *)indexPath;
- (NSString *)timeForIndexPath:(NSIndexPath *)indexPath;

- (NSString *)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end
