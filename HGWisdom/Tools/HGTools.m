//
//  HGTools.m
//  HGWisdom
//
//  Created by 小雨很美 on 2017/4/25.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import "HGTools.h"

#import "NSObject+HGExtention.h"

#include <netdb.h>
#import <SystemConfiguration/SystemConfiguration.h>


void HLOG(const char *func, int lineNumber, NSString *format, ...)
{
    va_list args;
    va_start(args, format);
    NSString *prependedFormatString = [NSString stringWithFormat:@"Function: %s, Line: %i, INFO:%@",func,lineNumber, format];
    NSLogv(prependedFormatString, args);
    va_end(args);
}

void HLOGError( NSString *format, ...){

//    va_list args;
//    va_start(args, format);
//    NSString *string = [[NSString alloc] initWithFormat:format arguments:args];
//    va_end(args);

//    NSString *identifyInfo = [[YYRecoreLogin sharedManager] getIdentifyInfo];
//    NSString *strFormat = [NSString stringWithFormat:@"%@ %@",identifyInfo,string];

//    LogError(@"%@", strFormat);
}

//-(NSString*)getIdentifyInfo{
//
//    NSDate * senddate=[NSDate date];
//    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
//    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSString * locationString=[dateformatter stringFromDate:senddate];
//
//    NSString *strFormat = [NSString stringWithFormat:@"%@ %ld %@ %@",
//                           locationString,
//                           (long)[YYLoginResponse sharedYYLoginResponse].userId,
//                           [[UIDevice currentDevice] model],
//                           [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey]];
//    return strFormat;
//}


@implementation HGTools

+(void)alertWithMessage:(NSString*)message
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    ;
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancelAction];

    [[self hg_viewController] presentViewController:alert animated:YES completion:nil];
}

+(NSString *)appVersion{
    NSDictionary * dict = [[NSBundle mainBundle] infoDictionary];
    return [dict objectForKey:@"CFBundleShortVersionString"];
}
+ (NSMutableDictionary*)deviceInfo
{

    // 设备信息

    //手机别名： 用户定义的名称
    NSString* userPhoneName = [[UIDevice currentDevice] name];
    //手机系统名称
    //        NSString* systemName = [[UIDevice currentDevice] systemName];
    NSString* systemName = @"ios";
    //手机系统版本
    NSString* phoneVersion = [[UIDevice currentDevice] systemVersion];
    //    手机型号
    NSString* phoneModel = [[UIDevice currentDevice] model];
    //地方型号  （国际化区域名称）
    //    NSString* localPhoneModel = [[UIDevice currentDevice] localizedModel];
    NSString * deviceID = [self UUID];


    NSMutableDictionary * deviceInfoDic = [NSMutableDictionary dictionary];
    [deviceInfoDic setValue:@"Apple" forKey:@"manufacturer"];//厂商????????
    [deviceInfoDic setValue:deviceID forKey:@"deviceID"];//设备ID
    [deviceInfoDic setValue:phoneModel forKey:@"devType"];//机器型号
    [deviceInfoDic setValue:phoneVersion forKey:@"osVersion"];//系统版本
    [deviceInfoDic setValue:systemName forKey:@"osType"];//系统类型
    [deviceInfoDic setValue:[self UUID] forKey:@"registerID"]; //极光ID??????
    [deviceInfoDic setValue:userPhoneName forKey:@"deviceInfo"];//设备信息?

    return deviceInfoDic;

}
+(NSString*)UUID
{
    return [[UIDevice currentDevice].identifierForVendor UUIDString] ;
}


+(bool)checkNetWork{
    // Create zero addy
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;

    // Recover reachability flags
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;

    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);

    if (!didRetrieveFlags)
    {
        printf("Error. Could not recover network reachability flags\n");
        return NO;
    }

    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
}



//GCD 倒计时
+ (dispatch_source_t)countDownWithTime:(int)time
                        countDownBlock:(void (^)(int timeLeft))countDownBlock
							  endBlock:(void (^)(void))endBlock
{
    __block int timeout = time; //倒计时时间

    //创建用户队列      函数的第一个参数是一个标签，这纯是为了debug。Apple建议我们使用倒置域名来命名队列，比如“com.dreamingwish.subsystem.task”。这些名字会在崩溃日志中被显示出来，也可以被调试器调用，这在调试中会很有用。
    //    DISPATCH_QUEUE_SERIAL 串行
    //    DISPATCH_QUEUE_CONCURRENT 并行

    dispatch_queue_t queue = dispatch_queue_create("com.hgtime", DISPATCH_QUEUE_CONCURRENT);



    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            //            dispatch_release(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                if (endBlock) {
                    endBlock();
                }
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                timeout--;
                if (countDownBlock) {
                    countDownBlock(timeout);
                }
            });
        }
    });
    dispatch_resume(_timer);
    return _timer;
    
}

@end
