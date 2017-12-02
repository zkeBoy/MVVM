//
//  ZKBaseViewModel.h
//  MVVM
//
//  Created by Tom on 2017/12/1.
//  Copyright © 2017年 Tom. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^completionHandler)(NSError * error);

@protocol ZKBaseViewModelDelegate <NSObject>
@optional
- (void)getDataWithCompleteHandler:(completionHandler)completionHandler;
- (void)refreshDataWithCompleteHandler:(completionHandler)completionHandler;
- (void)getMoreDataWithCompleteHandler:(completionHandler)completionHandler;
@end

@interface ZKBaseViewModel : NSObject <ZKBaseViewModelDelegate>
@property (nonatomic, strong) NSMutableArray * dataArray;

@end

