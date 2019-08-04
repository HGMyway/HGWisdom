//
//  NSObject+HGMethod.m
//  HGTest
//
//  Created by 小雨很美 on 2018/8/4.
//  Copyright © 2018年 小雨很美. All rights reserved.
//

#import "NSObject+HGMethod.h"
#import "HGSafeGuard.h"
#import <objc/runtime.h>

void fakeSwizzlIMP(id sender, SEL sel){
    NSLog(@"fakeIMP active:[sender %@] [sel %@]",sender , NSStringFromSelector(sel));
}
@implementation NSObject (HGMethod)
+ (void)logMethodlist{
    unsigned int methodCount = 0;
    Method *methods = class_copyMethodList([self class], &methodCount);
    NSLog(@"methodCount = %d",methodCount);
    
    for (NSUInteger index = 0; index < methodCount; index++) {
        Method method = methods[index];
        NSLog(@"methodName %@", NSStringFromSelector(method_getName(method)));
        NSLog(@"imp %p",method_getImplementation(method));
    }
    NSLog(@"打印完成");
}
+ (void)hg_swizzlInstanseMethod:(SEL)originalSelector
               swizzledSelector:(SEL)swizzledSelector{
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod)?:(IMP)fakeSwizzlIMP, method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [self hg_swizzlInstanseMethod:@selector(forwardingTargetForSelector:) swizzledSelector:@selector(hg_forwardingTargetForSelector:)];
        
    });
}

- (id)hg_forwardingTargetForSelector:(SEL)aSelector{
    NSMethodSignature *signature = [self methodSignatureForSelector:aSelector];
    if ([self respondsToSelector:aSelector] || signature) {
        return [self hg_forwardingTargetForSelector:aSelector];
    }
    return [HGSafeGuard createFakeForwardTargetObject:self selector:aSelector];
}
@end



@implementation NSObject (Perform)
- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects {
    
    NSMethodSignature *signature = [self methodSignatureForSelector:selector];
    if (signature) {
        NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:selector];
        for(int i = 0;i < [objects count];i++) {
            id object = [objects objectAtIndex:i];
            [invocation setArgument:&object atIndex:(i+2)];
        }
        [invocation invoke];
        if (signature.methodReturnLength) {
            id anObject;
            [invocation getReturnValue:&anObject];
            return anObject;
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}
@end
