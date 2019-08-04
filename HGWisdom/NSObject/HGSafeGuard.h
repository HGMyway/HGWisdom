//
//  HGSafeGuard.h
//  HGTest
//
//  Created by 小雨很美 on 2018/8/4.
//  Copyright © 2018年 小雨很美. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HGSafeGuard : NSObject
+ (id)createFakeForwardTargetObject:(id)aTarget selector:(SEL)aSelector;
@end
