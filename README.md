# WebViewJavaScriptBridge
一个js与ios原生代码交互的小工具库，方便，简单，易用。
#### 支持功能：
1. 原生掉js函数，并自动相应js函数回调。
2. js掉原生函数，并自动响应原生函数回调。
#### 用法：
1. 初始化bridge对象：

`_bridge = [[WebViewJavaScriptBridge alloc] initWithWebViewFrame:rect];`

`_bridge.bridgeDelegate = self;`

`_bridge.methodDeletage = self;//js调用原生函数的所属类`

2. js掉原生方法，需要注册当前html页面所要调用的原生方法名：

`NSString *baseURL = [NSString stringWithFormat:@"%@/www/%@",[NSBundle mainBundle].bundlePath,@"html/index.html"];`

`[_bridge loadHtmlWithURL:baseURL];//显示本地html页面`

`//NSString *remoteURL = @"";`

`//[_bridge loadRemoteURL:remoteURL]; //显示远程html页面`

`[_bridge registWithMethodName:@"test1"];//js掉原生代码要先注册`

3. js调用方法 API:

`mobile.send("test1",参数（js对象）,function(result){`

                    `alert(result.name);//回调结果`
                    
        `});`
        
4. 原生API:

`-(void)runJavaScriptWithName:(nonnull NSString*)name parames:(nullable NSDictionary*)parames completionHandler:(void (^ __nullable)(__nullable id))completionHandler;`

