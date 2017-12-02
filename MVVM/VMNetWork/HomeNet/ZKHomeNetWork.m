//
//  ZKHomeNetWork.m
//  MVVM
//
//  Created by Tom on 2017/12/2.
//  Copyright © 2017年 Tom. All rights reserved.
//

#import "ZKHomeNetWork.h"

@implementation ZKHomeNetWork

+ (id)requestWithType:(listType)type lastTime:(NSString *)lastTime page:(NSInteger)page completionHandler:(void(^)(id obj, NSError *error))completionHandler{
    NSString * path;
    if (type == listTypeFir) {
        
    }else if (type == listTypeNba){
        
    }else if (type == listTypeTec){
        path = @"http://app3.qdaily.com/app3/homes/index/0.json?";
    }
    return [self GET:path para:nil progress:nil completionHandler:completionHandler];
}

@end
