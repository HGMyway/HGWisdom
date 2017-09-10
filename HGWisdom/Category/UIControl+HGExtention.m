//
//  UIControl+HGExtention.m
//  TPSApp
//
//  Created by 小雨很美 on 2017/4/26.
//  Copyright © 2017年 YY. All rights reserved.
//

#import "UIControl+HGExtention.h"
#import <objc/runtime.h>
#import <objc/message.h>



@interface UIControl ()
@property (nonatomic,strong) NSNumber* hg_ignoreEvent;
@end


@implementation UIControl (HGExtention)

- (NSNumber*)hg_acceptEventInterval
{
    return  objc_getAssociatedObject(self, @selector(hg_acceptEventInterval));
}
- (void)setHg_acceptEventInterval:(NSNumber *)hg_acceptEventInterval{
    objc_setAssociatedObject(self, @selector(hg_acceptEventInterval), hg_acceptEventInterval, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(NSNumber *)hg_ignoreEvent
{
    return objc_getAssociatedObject( self,  @selector(hg_ignoreEvent) );

}
-(void)setHg_ignoreEvent:(NSNumber *)hg_ignoreEvent
{
        objc_setAssociatedObject(self, @selector(hg_ignoreEvent), hg_ignoreEvent, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load
{
//    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
//    Method b = class_getInstanceMethod(self, @selector(hg_sendAction:to:froEvent:));
//
//    method_exchangeImplementations(a, b);
}

- (void)hg_sendAction:(SEL)action to:(id)target froEvent:(UIEvent *)event
{
    if (self.hg_ignoreEvent) {
        return;
    }
    if ([self.hg_acceptEventInterval integerValue] > 0) {
        self.hg_ignoreEvent = @YES;
        [self performSelector:@selector(setHg_ignoreEvent:) withObject:@NO afterDelay:[self.hg_acceptEventInterval integerValue]];
        /* GCD 延迟执行 self.acceptEventInterval：为延迟时间
         __weak typeof (self) weakSelf = self;
         dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.acceptEventInterval * NSEC_PER_SEC));

         dispatch_after(delayTime, dispatch_get_main_queue(), ^{
         weakSelf.userInteractionEnabled = YES;
         });

         */

    } else {
        [self hg_sendAction:action to:target froEvent:event];
    }

}
@end
