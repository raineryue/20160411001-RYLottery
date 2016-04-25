//
//  NSObject+Model.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/25.
//  Copyright © 2016年 Rainer. All rights reserved.
//  使用运行时实现字典转模型

#import "NSObject+Model.h"
#import <objc/runtime.h>

@implementation NSObject (Model)
/**
 *  字典转模型
 *  参数:
 *  dictionary:需要转模型的字典
 *  mapDictionary:模型中的属性和字典中的属性不一样的时候需要在这里配置一个键值映射关系如：自定中有个属性为id，但是id在OC中为关键字，因此模型设计为ID
 *                那么此时就需要配一个影射关系为：@{@"ID":@"id"}
 */
+ (instancetype)objectWithDictionary:(NSDictionary *)dictionary mapDictionary:(NSDictionary *)mapDictionary {
    // 1.创建一个对象
    id object = [[self alloc] init];
    
    // 2.定义一个变量记录类中的所有属性
    unsigned int outCount = 0;
    
    // 3.使用运行时机制从类中取出所有属性名
    Ivar *ivars = class_copyIvarList(self, &outCount);
    
    // 4.遍历所有属性名，使用这些属性名从字典中获取值
    for (int i = 0; i < outCount; i++) {
        // 4.1.获取第i个属性名
        Ivar ivar = ivars[i];
        
        // 4.2.将属性名转为OC字符串对象
        NSString *ivarName = @(ivar_getName(ivar));
        
        // 4.3.将带"_"的属性剪切为不带"_"的属性
        ivarName = [ivarName substringFromIndex:1];
        
        // 4.4.使用不带"_"的属性从字典中取出对应的值
        id value = dictionary[ivarName];
        
        // 4.5.如果字典中没有这个值，说明有可能改属性被映射了
        if (nil == value) {
            // 4.5.1.判断映射字典是否有信息
            if (mapDictionary) {
                // 4.5.1.1.使用不带"_"的属性从映射字典中取出对应的值（即原字典的key）
                NSString *keyName = mapDictionary[ivarName];
                
                // 4.5.1.2.使用原字典的key从原字典中取出对应的value值
                value = dictionary[keyName];
            }
        }
        
        // 4.6.使用KVC给当前类对象的属性复制
        [object setValue:value forKey:ivarName];
    }
    
    // 5.返回对象
    return object;
}

@end
