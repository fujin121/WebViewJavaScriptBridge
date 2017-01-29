//
//  WebViewJavaScriptBridge.h
//  mfapp
//
//  Created by fujin on 15/11/26.
//  Copyright © 2015年 mofang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>


@protocol WebViewJavaScriptBridgeDelegate <NSObject>

@optional

- (void)webViewFinishedLoad;

@end

@interface WebViewJavaScriptBridge : NSObject

@property(nonatomic,weak,nullable) id methodDeletage;

@property(nonatomic,weak,nullable) id<WebViewJavaScriptBridgeDelegate> bridgeDelegate;

@property(nonatomic,strong,nullable) UIView *webView;






-(nonnull instancetype)initWithWebViewFrame:(CGRect)rect;

-(void)loadHtmlWithURL:(nonnull NSString*)url;


-(void)registWithMethodName:(nonnull NSString*)methodName;

-(void)registWithMethodName:(nonnull NSString *)methodName isEnable:(BOOL)isEnable;

-(void)runJavaScriptWithName:(nonnull NSString*)name parames:(nullable NSDictionary*)parames completionHandler:(void (^ __nullable)(__nullable id))completionHandler;


-(BOOL)isCanBack;

-(void)goBack;

@end
