//
//  QinzHttpRequest.h
//  QinzBaseProject
//


#import <Foundation/Foundation.h>

//公司的两大平台，筷子和ECP
typedef NS_ENUM(NSInteger,Platform){

    PlatformClound,
    PlatformECP
};


@interface QinzHttpRequest : NSObject

//请求平台
@property(nonatomic,assign)Platform requestPlatform;

//请求的超时时间，默认设为15s
@property(nonatomic,assign)NSTimeInterval outTime;


/**
 *  客户端发送POST请求方法
 *
 *  @param url        网络请求地址
 *  @param parameters 请求参数
 *  @param response   响应信息
 */
- (void)postRequestToURL:(NSString *) url parameters:(NSDictionary *) parameters returnResponse:(void (^)(id data,NSError *error)) responseBlcok;


/**
 *  客户端发送GET请求方法
 *
 *  @param url        网络请求地址
 *  @param parameters 请求参数
 *  @param response   响应信息
 */
- (void)getRequestToRUL:(NSString *) url parameters:(NSDictionary *) parameters returnResponse:(void (^)(id data,NSError *error)) responseBlcok;

/**
 *  取消本次请求
 */
- (void)cancelRequest;

@end
