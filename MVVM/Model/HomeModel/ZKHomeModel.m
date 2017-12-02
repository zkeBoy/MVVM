//
//  ZKHomeModel.m
//  MVVM
//
//  Created by Tom on 2017/12/1.
//  Copyright © 2017年 Tom. All rights reserved.
//

#import "ZKHomeModel.h"

@implementation ZKHomeModel
+ (NSDictionary *)objectClassInArray {
    return @{@"post":[ZKHomePost class]};
}
@end

@implementation ZKHomePost
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id",
             @"Description":@"description"};
}
+ (NSDictionary *)objectClassInArray {
    return @{@"category":[ZKHomeCategory class]};
}
@end

@implementation ZKHomeCategory
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end
