//
//  RYSaveDataLocationUtil.h
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/20.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RYSaveDataLocationUtil : NSObject

/*!
 +objectForKey: will search the receiver's search list for a default with the key 'defaultName' and return it. If another process has changed defaults in the search list, NSUserDefaults will automatically update to the latest values. If the key in question has been marked as ubiquitous via a Defaults Configuration File, the latest value may not be immediately available, and the registered value will be returned instead.
 */
+ (nullable id)objectForKey:(NSString *)defaultName;

/*!
 +setObject:forKey: immediately stores a value (or removes the value if nil is passed as the value) for the provided key in the search list entry for the receiver's suite name in the current user and any host, then asynchronously stores the value persistently, where it is made available to other processes.
 */
+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName;

@end
