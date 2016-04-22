//
//  NSArray+Log.m
//  20151218001-UITableViewController-QQMessageView
//
//  Created by Rainer on 15/12/20.
//  Copyright © 2015年 Rainer. All rights reserved.
//

#import "NSArray+Log.h"

@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *descriptionString = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [descriptionString appendFormat:@"\t%@, \n", obj];
    }];
    
    [descriptionString appendFormat:@")\n"];
    
    return descriptionString;
}

@end

@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *descriptionString = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [descriptionString appendFormat:@"\t%@:%@, \n", key, obj];
    }];
    
    [descriptionString appendString:@"}\n"];
    
    return descriptionString;
}

@end