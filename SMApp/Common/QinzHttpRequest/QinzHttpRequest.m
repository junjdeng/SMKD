//  QinzHttpRequest.m
//  QinzBaseProject


#import "QinzHttpRequest.h"
#import "AFNetworking.h"
#import "NSData+Encrypt.h"
#import "Common.h"
#define LocalMyString(key) NSLocalizedStringFromTable(key,@"Localizable", key)

typedef void(^ResponseBlcok)(id, NSError *);

//post 和 get两种请求方式
typedef NS_ENUM(NSInteger,RequestMethod){
    RequestMethodPost,
    RequestMethodGet
};

@interface QinzHttpRequest ()
{
    NSString *_requestUrl;//请求地址
    RequestMethod _requestMethod;//请求方式
    NSDictionary *_requstParams;//请求参数
    NSURLSessionDataTask *_task;
      NSInteger _num;
}
//响应头的回调，将请求的数据和错误信息返回
@property (nonatomic, copy) ResponseBlcok responseBlcok;

@end

@implementation QinzHttpRequest

//变量会存储到全局变量区，生命周期和程序相同
static NSDictionary *mustParameterDic;

//在类加载的时候就读取必须配置的参数plist
+(void)initialize{
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"MustParameterList" ofType:@"plist"];
    
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    if ([data isKindOfClass:[NSDictionary class]]) {
        mustParameterDic  = data;
    }
}
//初始化的时候设置网络请求超时的时间和请求的平台
- (instancetype)init{
    if (self = [super init]) {
        _outTime = 15.0f;//默认超时时间
        _requestPlatform = PlatformClound;
        
    }
    return self;
}

//用AFNetworking检测网络状态--检测服务器的地址
- (void)networkReachabilityWithNetState:(void (^)(BOOL))netState{
    NSURL *baseURL = [NSURL URLWithString:_requestUrl];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    NSOperationQueue *operationQueue = manager.operationQueue;
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];//将运行队列的暂停设置为NO，即有网开启队列
                netState(YES);
                break;
            case AFNetworkReachabilityStatusNotReachable://无网络状态
                netState(NO);
            default://未知网络状态
                netState(NO);
                [operationQueue setSuspended:YES];//暂停运行队列
                break;
        }
    }];
    //开启网络监测
    [manager.reachabilityManager startMonitoring];
}


#pragma mark- POST请求
- (void)postRequestToURL:(NSString *)url parameters:(NSDictionary *)parameters returnResponse:(void (^)(id, NSError *))responseBlcok{
    _requestUrl = url;
    _requstParams = parameters;
    _requestMethod = RequestMethodPost;
    _responseBlcok = responseBlcok;
    [self sendRequest];
}

#pragma mark- GET请求
- (void)getRequestToRUL:(NSString *)url parameters:(NSDictionary *)parameters returnResponse:(void (^)(id, NSError *))response{
    _requestUrl = url;
    _requstParams = parameters;
    _requestMethod = RequestMethodGet;
    _responseBlcok = response;
    
    [self sendRequest];
}

- (void)sendRequest{

    //先判断是否有网络
    if ([Common getCurrageNetWorkStatus]!=0) {
        //这里需要对参数进行加密
        NSDictionary *params = [self encryptParams];
        if (_requestMethod == RequestMethodPost) {
            
            [self postRequestWithParams:params];
        }else{
            [self getRequestParams:params];
        }
    }else{//网络不可通
        NSDictionary *userInfo = @{NSLocalizedDescriptionKey:LocalMyString(@"networking.connect.error")};
        NSError* error = [NSError errorWithDomain:@"www.zxmall.com" code:404 userInfo:userInfo];
        self.responseBlcok(nil,error);
    }
}
#pragma mark- 进行加密
- (NSDictionary *) encryptParams{
    switch (_requestPlatform) {
        case PlatformClound:
            return [self platformCloundEncryptParams];
        case PlatformECP:
        return [self platformECPEncryptParams];
        default:
            return [self platformCloundEncryptParams];
    }
    
}

#pragma mark--对筷子平台的参数进行加密
- (NSDictionary *) platformCloundEncryptParams{
    
    //拼接param参数
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionary];
    NSString *imei = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    //当前时间戳
    NSString *timeSp = [NSString stringWithFormat:@"%ld",(long)[[NSDate date] timeIntervalSince1970]];
    //合作商标识
    [paramsDic setObject:mustParameterDic[@"uid"] forKey:@"u"];
    //手机唯一标识串
    [paramsDic setObject:imei forKey:@"i"];
    //当前版本号
    [paramsDic setObject:mustParameterDic[@"version"] forKey:@"v"];
    //当前手机时间
    [paramsDic setObject:timeSp forKey:@"t"];
    //手机类型标识
    [paramsDic setObject:mustParameterDic[@"mn"] forKey:@"m"];
    //所有的Value只对中文进行编码
    for (NSString *key in _requstParams.allKeys) {
//        NSString *value = [Common chinaToUnicode:[_requstParams objectForKey:key]];
          NSString *value = [_requstParams objectForKey:key];
        [paramsDic setObject:value forKey:key];
    }
    
    //对key进行排序
    NSArray *keyArr = [paramsDic.allKeys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];
    
    //进行si的拼接
    NSMutableString* siStr = [NSMutableString new];
    for (NSString *key in keyArr) {
        [siStr appendFormat:@"%@=%@",key,[paramsDic objectForKey:key]];
    }
    //进行si的MD5签名和pa的DES+Base64加密
    
    //将参数转成json字符串
    NSString *paStr = [self dataToJSON:paramsDic];
    //先将参数转二进制
    NSData *data = [paStr dataUsingEncoding:NSUTF8StringEncoding];
    //签名使用MD5加密
    NSDictionary *dict = @{@"si":[Common md5HexDigest:siStr],
                           @"pa":[[NSData desEncrypt:data] base64EncodedString]};//DES+Base64
    
    return dict;
}

#pragma mark- 转json字符串
- (NSString*) dataToJSON:(NSDictionary*)params{
    if (params) {
        //字典转json
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
        return  error==nil?[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]:@"";
    }else{
        return @"";
    }
}

#pragma mark--对ECP平台的参数进行加密
- (NSDictionary *) platformECPEncryptParams{
    
    LOG(@"\n请求的地址为:<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<\n%@\n参数end>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>",_requestUrl);
    LOG(@"\n传给后台的参数为:==========================================\n%@\n参数end==========================================",_requstParams);
    
    NSMutableDictionary* paramsDic = [NSMutableDictionary new];
    NSMutableString* signStr = [NSMutableString new];
 
    NSString *imei = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    //当前时间戳
    NSString *timeSp = [NSString stringWithFormat:@"%ld",(long)[[NSDate date] timeIntervalSince1970]];
    [paramsDic setObject:imei forKey:@"imei"];
    [signStr appendString:[NSString stringWithFormat:@"imei=%@",imei]];
    [paramsDic setObject:mustParameterDic[@"mn"] forKey:@"mn"];
    [signStr appendString:[NSString stringWithFormat:@"mn=%@",mustParameterDic[@"mn"]]];
    NSString *json = [self dataToJSON:_requstParams];
    if ([_requstParams count] > 0 && json.length > 0) {
        [paramsDic setObject:json forKey:@"param"];
        [signStr appendString:[NSString stringWithFormat:@"param=%@",json]];
    }
    [paramsDic setObject:mustParameterDic[@"token"] forKey:@"token"];
    [signStr appendString:[NSString stringWithFormat:@"token=%@",mustParameterDic[@"token"]]];
    [paramsDic setObject:timeSp forKey:@"ts"];
    [signStr appendString:[NSString stringWithFormat:@"ts=%@",timeSp]];
    [paramsDic setObject:mustParameterDic[@"version"] forKey:@"version"];
    [signStr appendString:[NSString stringWithFormat:@"version=%@",mustParameterDic[@"version"]]];
    
    //进行MD5加密
    [paramsDic setObject:[Common md5HexDigest:signStr] forKey:@"sign"];
    //展式请求的地址及其参数
    
    return paramsDic;
}

#pragma mark--Post请求
- (void) postRequestWithParams:(NSDictionary *) params{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = _outTime;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//默认是json解析,所以我们要写出http二进制的返回
    [manager POST:_requestUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        _responseBlcok(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        _responseBlcok(nil,error);
    }];
}

#pragma mark--GET请求
- (void) getRequestParams:(NSDictionary *) params{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = _outTime;
    [manager GET:_requestUrl parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _responseBlcok(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        _responseBlcok(nil,error);
    }];
}

#pragma mark- 取消请求
- (void) cancelRequest{
    if (_task != nil) {
        [_task cancel];
        _task = nil;
    }
}

@end
