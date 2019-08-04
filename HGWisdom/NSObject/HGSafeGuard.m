//
//  HGSafeGuard.m
//  HGTest
//
//  Created by 小雨很美 on 2018/8/4.
//  Copyright © 2018年 小雨很美. All rights reserved.
//

#import "HGSafeGuard.h"
#import "HGFakeForwardTargetObject.h"

@implementation HGSafeGuard
+ (id)createFakeForwardTargetObject:(id)aTarget selector:(SEL)aSelector{
    if ([[NSString string] respondsToSelector:aSelector]) {
        NSString *szTarget = nil;
        if ([aTarget isKindOfClass:[NSNumber class]]) {
            szTarget = [NSString stringWithFormat:@"%@", aTarget];
        }
        if (szTarget) {
            return szTarget;
        }
    }
    HGFakeForwardTargetObject *fakeTaget = [[HGFakeForwardTargetObject alloc] initWithSelector:aSelector];
    return fakeTaget;
}
@end
