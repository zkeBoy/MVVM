//
//  ZKHomeModel.h
//  MVVM
//
//  Created by Tom on 2017/12/1.
//  Copyright © 2017年 Tom. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZKHomePost,ZKHomeCategory;

@interface ZKHomeModel : NSObject
@property (nonatomic, copy) NSString * image;
@property (nonatomic, copy) NSString * type;
@property (nonatomic, strong) ZKHomePost * post;
@end

@interface ZKHomePost:NSObject
@property (nonatomic, copy) NSString * ID;
@property (nonatomic, copy) NSString * genre;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * Description;
@property (nonatomic, copy) NSString * publish_time;
@property (nonatomic, copy) NSString * image;
@property (nonatomic, copy) NSString * start_time;
@property (nonatomic, copy) NSString * comment_count;
@property (nonatomic, copy) NSString * praise_count;
@property (nonatomic, copy) NSString * super_tag;
@property (nonatomic, copy) NSString * page_style;
@property (nonatomic, copy) NSString * post_id;
@property (nonatomic, copy) NSString * appview;
@property (nonatomic, copy) NSString * film_length;
@property (nonatomic, copy) NSString * datatype;
@property (nonatomic, strong) ZKHomeCategory * category;
@end

@interface ZKHomeCategory:NSObject
@property (nonatomic, copy) NSString * ID;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * normal;
@property (nonatomic, copy) NSString * normal_hl;
@property (nonatomic, copy) NSString * image_lab;
@property (nonatomic, copy) NSString * image_experiment;
@end
