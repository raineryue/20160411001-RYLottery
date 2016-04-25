//
//  RYQuestionTableViewController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/25.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYQuestionTableViewController.h"
#import "RYQuestionModel.h"

@interface RYQuestionTableViewController ()

@property (nonatomic, strong) NSMutableArray *questionArray;

@end

@implementation RYQuestionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"帮助";
    
    [self questionArray];
    
    NSLog(@"%@", [self questionArray]);
}

- (NSMutableArray *)questionArray {
    if (nil == _questionArray) {
        _questionArray = [NSMutableArray array];
        
        // 从mainBundle中获取文件的路径
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        
        // 从路径中获取文件的二进制数据
        NSData *questionData = [NSData dataWithContentsOfFile:filePath];
        
        // 将二进制数据解析成JSON数组
        NSArray *array = [NSJSONSerialization JSONObjectWithData:questionData options:NSJSONReadingAllowFragments error:nil];
        
        // 循环JSON数组，取出JSON字典转成模型后添加到数组中
        [array enumerateObjectsUsingBlock:^(NSDictionary *dictionary, NSUInteger idx, BOOL *stop) {
            // 字典转模型
            RYQuestionModel *question = [RYQuestionModel questionModelWithDictionary:dictionary];
            
            [_questionArray addObject:question];
        }];
    }
    
    return _questionArray;
}

@end
