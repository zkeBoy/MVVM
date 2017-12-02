//
//  ZKHomeViewModel.m
//  MVVM
//
//  Created by Tom on 2017/12/1.
//  Copyright © 2017年 Tom. All rights reserved.
//

#import "ZKHomeViewModel.h"
#import "ZKHomeNetWork.h"

@implementation ZKHomeViewModel

- (NSInteger)rowNum {
    return self.dataArray.count;
}

- (ZKHomeModel *)modelForIndexPath:(NSIndexPath *)indexPath {
    return self.dataArray[indexPath.row];
}

- (NSURL *)iconURLForIndexPath:(NSIndexPath *)indexPath{
    return [NSURL URLWithString:[self modelForIndexPath:indexPath].image];
}

- (NSString *)titleForIndexPath:(NSIndexPath *)indexPath {
    return [self modelForIndexPath:indexPath].post.title;
}

- (NSString *)praiseNumForIndexPath:(NSIndexPath *)indexPath{
    return [self modelForIndexPath:indexPath].post.praise_count;
}

- (NSString *)didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self modelForIndexPath:indexPath].post.appview;
}

#pragma mark - ZKBaseViewModelDelegate
- (void)getDataWithCompleteHandler:(completionHandler)completionHandler{
    [ZKHomeNetWork requestWithType:listTypeTec lastTime:self.updateTime page:self.page completionHandler:^(id obj, NSError *error) {
        if (!error) {
            if (self.page==0) {
                [self.dataArray removeAllObjects];
            }
            [self.dataArray addObjectsFromArray:[ZKHomeModel mj_objectArrayWithKeyValuesArray:obj[@"response"][@"feeds"]]];
        }
        completionHandler (error);
    }];
}

- (void)refreshDataWithCompleteHandler:(completionHandler)completionHandler{
    self.page = 0;
    self.updateTime = @"0";
    [self getDataWithCompleteHandler:completionHandler];
}

- (void)getMoreDataWithCompleteHandler:(completionHandler)completionHandler{
    self.page++;
    [self getDataWithCompleteHandler:completionHandler];
}

@end
