//
//  RYQuestionModel.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/25.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYQuestionModel.h"

@implementation RYQuestionModel

- (instancetype)initQuestionModelWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
//        [self setValuesForKeysWithDictionary:dictionary];
        self = [RYQuestionModel objectWithDictionary:dictionary mapDictionary:@{@"ID":@"id"}];
    }
    
    return self;
}

+ (instancetype)questionModelWithDictionary:(NSDictionary *)dictionary {
    return [[RYQuestionModel alloc] initQuestionModelWithDictionary:dictionary];
}

//- (void)setValue:(id)value forKey:(NSString *)key {
//    if ([key isEqualToString:@"id"]) {
//        [self setValue:value forKey:@"ID"];
//    } else {
//        [super setValue:value forKey:key];
//    }
//}

/**
 *  复写该方法用来输出该对象的属性
 */
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p> {title = %@, html = %@, ID = %@}", self.class, self, self.title, self.html, self.ID];
}

@end
