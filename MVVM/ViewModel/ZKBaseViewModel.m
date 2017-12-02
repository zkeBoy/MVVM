//
//  ZKBaseViewModel.m
//  MVVM
//
//  Created by Tom on 2017/12/1.
//  Copyright © 2017年 Tom. All rights reserved.
//

#import "ZKBaseViewModel.h"

@implementation ZKBaseViewModel
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}
@end
