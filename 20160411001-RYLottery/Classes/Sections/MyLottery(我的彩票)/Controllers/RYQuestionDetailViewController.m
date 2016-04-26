//
//  RYQuestionDetailViewController.m
//  20160411001-RYLottery
//
//  Created by Rainer on 16/4/26.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "RYQuestionDetailViewController.h"
#import "RYQuestionModel.h"

@interface RYQuestionDetailViewController () <UIWebViewDelegate>

@end

@implementation RYQuestionDetailViewController

/**
 *  复写loadView方法给控制器设置根试图为网页试图
 */
- (void)loadView {
    // 设置当前控制器试图为网页试图
    self.view = [[UIWebView alloc] init];
}

/**
 *  控制器试图加载完成
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置导航条右边的取消按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismissBarButtonItemClickAction:)];
    
    // 2.加载当前的网页信息
    // 2.1.获取网页资源的路径
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:self.questionModel.html withExtension:nil];
    
    // 2.2.将控制器试图强转为网页试图
    UIWebView *webView = (UIWebView *)self.view;
    // 2.3.设置代理
    webView.delegate = self;
    
    // 2.4.加载网页
    [webView loadRequest:[NSURLRequest requestWithURL:fileUrl]];
}

/**
 *  网页加载完成调用
 */
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    // 拼接javascript脚本
    NSString *javaScriptString = [NSString stringWithFormat:@"window.location.href = '#%@';", self.questionModel.ID];
    
    // 执行javascript脚本
    [webView stringByEvaluatingJavaScriptFromString:javaScriptString];
}

/**
 *  取消按钮点击事件
 */
- (void)dismissBarButtonItemClickAction:(UIBarButtonItem *)barButtonItem {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

@end
