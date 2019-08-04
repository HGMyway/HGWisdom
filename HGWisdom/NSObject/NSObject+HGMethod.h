//
//  NSObject+HGMethod.h
//  HGTest
//
//  Created by 小雨很美 on 2018/8/4.
//  Copyright © 2018年 小雨很美. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (HGMethod)
+ (void)hg_swizzlInstanseMethod:(SEL)originalSelector
            swizzledSelector:(SEL)swizzledSelector;
@end



@interface NSObject (Perform)
- (id)performSelector:(SEL)selector withObjects:(NSArray *)objects ;
@end

NS_ASSUME_NONNULL_END
