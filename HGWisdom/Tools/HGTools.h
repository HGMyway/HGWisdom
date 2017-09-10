//
//  HGTools.h
//  HGWisdom
//
//  Created by 小雨很美 on 2017/4/25.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//#define DEBUG_LOG

#ifdef DEBUG_LOG
#define HGLog(fmt, ...) HLOG(__PRETTY_FUNCTION__, __LINE__, fmt, ##__VA_ARGS__)
#else
#define HGLog(fmt, ...)
#endif


void HLOGError( NSString *format, ...);
void HLOG(const char *func, int lineNumber, NSString *format, ...);

@interface HGTools : NSObject

+(NSString *)appVersion;
+ (NSMutableDictionary*)deviceInfo;
+(NSString*)UUID;

+(bool)checkNetWork;
+(void)alertWithMessage:(NSString*)message;


/**
 GCD倒计时

 @param time 倒计时时间（秒）
 @param countDownBlock 倒计时回调
 @param endBlock 倒计时结束回调
 @return 返回一个创建的任务。    简单来说，dispatch source是一个监视某些类型事件的对象。当这些事件发生时，它自动将一个block放入一个dispatch queue的执行例程中。
 */
+ (dispatch_source_t)countDownWithTime:(int)time
                        countDownBlock:(void (^)(int timeLeft))countDownBlock
							  endBlock:(void (^)(void))endBlock;
@end


/*
 git tag -d v0.1
 git push
 git tag -m "add" "0.0.3"
 git push  --tags
 pod trunk push HGWisdom.podspec
 ```
 Pod search 失败
 ```
 rm ~/Library/Caches/CocoaPods/search_index.json


 Podsped

 http://blog.wtlucky.com/blog/2015/02/26/create-private-podspec/

 http://www.cnblogs.com/wengzilin/p/4742530.html

 http://www.jianshu.com/p/d7d1942dd3f1

 Pod search 失败
 rm ~/Library/Caches/CocoaPods/search_index.json
 
 
 sheng d j re
 */
