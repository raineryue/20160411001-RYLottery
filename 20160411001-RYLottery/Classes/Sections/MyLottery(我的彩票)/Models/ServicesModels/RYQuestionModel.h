//
//  RYQuestionModel.h
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/25.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYBaseModel.h"

@interface RYQuestionModel : RYBaseModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *ID;

- (instancetype)initQuestionModelWithDictionary:(NSDictionary *)dictionary;

+ (instancetype)questionModelWithDictionary:(NSDictionary *)dictionary;

@end
