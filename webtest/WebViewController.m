//
//  WebViewController.m
//  webtest
//
//  Created by fujin on 17/1/27.
//  Copyright © 2017年 mofanghr. All rights reserved.
//

#import "WebViewController.h"
#import "WebViewJavaScriptBridge.h"

@interface WebViewController ()<WebViewJavaScriptBridgeDelegate>
{
    WebViewJavaScriptBridge *_bridge;
}

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect rect = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height - 20);
    _bridge = [[WebViewJavaScriptBridge alloc] initWithWebViewFrame:rect];
    _bridge.bridgeDelegate = self;
    _bridge.methodDeletage = self;//js调用原生函数的所属类
    [self.view addSubview:_bridge.webView];
    [_bridge loadHtmlWithURL:@"html/index.html"];
    [_bridge registWithMethodName:@"test1"];//js掉原生代码要先注册
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

- (void)webViewFinishedLoad
{
    NSMutableDictionary *response = [[NSMutableDictionary alloc] init];
    response[@"name"] = @"原生掉js";
    [_bridge runJavaScriptWithName:@"test" parames:response completionHandler:^(id result) {
        NSLog(@"%@",result);
    }];
}



- (NSDictionary*)test1:(NSDictionary*)dic
{
    NSString *name = dic[@"name"];
    NSString *password = dic[@"password"];
    NSMutableDictionary *response = [[NSMutableDictionary alloc] init];
    response[@"name"] = name;
    response[@"password"] = password;
    return response;
}



@end
