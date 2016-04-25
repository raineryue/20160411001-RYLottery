//
//  NSObject+Model.h
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/25.
//  Copyright © 2016年 Rainer. All rights reserved.
//  字典转模型

#import <Foundation/Foundation.h>

@interface NSObject (Model)
/**
 *  字典转模型
 *  参数:
 *  dictionary:需要转模型的字典
 *  mapDictionary:模型中的属性和字典中的属性不一样的时候需要在这里配置一个键值映射关系如：自定中有个属性为id，但是id在OC中为关键字，因此模型设计为ID
 *                那么此时就需要配一个影射关系为：@{@"ID":@"id"}
 */
+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary mapDictionary:(NSDictionary *)mapDictionary;

@end
