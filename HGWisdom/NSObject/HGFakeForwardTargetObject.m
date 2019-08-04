//
//  HGFakeForwardTargetObject.m
//  HGTest
//
//  Created by 小雨很美 on 2018/8/4.
//  Copyright © 2018年 小雨很美. All rights reserved.
//

#import "HGFakeForwardTargetObject.h"
#import <objc/runtime.h>

void fakeIMP(id sender, SEL sel){
    NSLog(@"fakeIMP active:[sender %@] [sel %@]",sender , NSStringFromSelector(sel));
}

@implementation HGFakeForwardTargetObject
- (instancetype)initWithSelector:(SEL)aSelector{
    if (self = [super init]) {
        if (class_addMethod([self class], aSelector, (IMP)fakeIMP, NULL)) {
            
            NSLog(@"add Fake Selector:[instance %@]", NSStringFromSelector(aSelector));
        }
    }
    return self;
}
@end
