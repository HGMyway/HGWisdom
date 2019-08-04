//
//  UIButton+HGPosition.m
//  WoseekShipper
//
//  Created by 小雨很美 on 2018/5/31.
//  Copyright © 2018年 小雨很美. All rights reserved.
//

#import "UIButton+HGPosition.h"
#import <objc/runtime.h>
#import "NSObject+HGMethod.h"
@implementation UIButton (HGPosition)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self hg_swizzlInstanseMethod:@selector(titleRectForContentRect:) swizzledSelector:@selector(hg_position_titleRectForContentRect:)];
         [self hg_swizzlInstanseMethod:@selector(imageRectForContentRect:) swizzledSelector:@selector(hg_position_imageRectForContentRect:)];
        
        [self hg_swizzlInstanseMethod:@selector(contentRectForBounds:) swizzledSelector:@selector(hg_position_contentRectForBounds:)];
        
        [self hg_swizzlInstanseMethod:@selector(setFrame:) swizzledSelector:@selector(hg_position_setFrame:)];
        [self hg_swizzlInstanseMethod:@selector(setBounds:) swizzledSelector:@selector(hg_position_setBounds:)];
        
        //        [self swizzInstanceMethod:[self class] originalSelector:@selector(setBounds:) swizzledSelector:@selector(hg_setBounds:)];
        //        [self swizzInstanceMethod:[self class] originalSelector:@selector(setFrame:) swizzledSelector:@selector(hg_setFrame:)];
    });
}

- (void)hg_position_setFrame:(CGRect)frame{
    if (self.tag == 10 ) {
        NSLog(@"dd");
    }
    [self hg_position_setFrame:frame];
}
- (void)hg_position_setBounds:(CGRect)bounds{
    
    [self hg_position_setBounds:bounds];
}

- (HGButtonImagePosition)hg_imagePosition{
    return [objc_getAssociatedObject(self, @selector(hg_imagePosition)) integerValue];
}

- (NSInteger)hg_IB_imagePosition{
    return self.hg_imagePosition;
}
- (void)setHg_IB_imagePosition:(NSInteger)hg_IB_imagePosition{
    self.hg_imagePosition = hg_IB_imagePosition;
}
- (void)setHg_imagePosition:(HGButtonImagePosition)hg_imagePosition{
    
    return objc_setAssociatedObject(self, @selector(hg_imagePosition), @(hg_imagePosition), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGRect)hg_position_titleRectForContentRect:(CGRect)contentRect{
    CGRect titleRect = [self  hg_position_titleRectForContentRect:contentRect];
    if (self.currentImage ) {
        CGRect imageRect = [self hg_position_imageRectForContentRect:contentRect];
        CGFloat contentH = CGRectGetHeight(contentRect);
        CGFloat imageH = CGRectGetHeight(imageRect);
        CGFloat titleH = CGRectGetHeight(titleRect);
        if (self.hg_imagePosition == HGButtonImagePositionRight ) {
            titleRect = CGRectMake(CGRectGetMinX(imageRect), CGRectGetMinY(titleRect), CGRectGetWidth(titleRect), CGRectGetHeight(titleRect));
        }else if (self.hg_imagePosition == HGButtonImagePositionTop){
            CGFloat y =  (contentH  - titleH + imageH + 4)/ 2  ;
            titleRect = CGRectMake((CGRectGetWidth(contentRect) - CGRectGetWidth(titleRect))/2,y, CGRectGetWidth(titleRect), CGRectGetHeight(titleRect));
//            self.contentEdgeInsets = UIEdgeInsetsMake(imageH, 0, 0, 0);
        }else if (self.hg_imagePosition == HGButtonImagePositionBottom){
            CGFloat y =  (contentH - (titleH + imageH + 4)) / 2;
            titleRect = CGRectMake((CGRectGetWidth(contentRect) - CGRectGetWidth(titleRect))/2, y, CGRectGetWidth(titleRect), CGRectGetHeight(titleRect));
//            self.contentEdgeInsets = UIEdgeInsetsMake(imageH, 0, 0, 0);
        }
    }
    return titleRect;
}

- (CGRect)hg_position_imageRectForContentRect:(CGRect)contentRect{
    CGRect imageRect = [self hg_position_imageRectForContentRect:contentRect];
    if (self.currentImage) {
        CGRect titleRect = [self  hg_position_titleRectForContentRect:contentRect];
        CGFloat contentH = CGRectGetHeight(contentRect);
        CGFloat imageH = CGRectGetHeight(imageRect);
        CGFloat titleH = CGRectGetHeight(titleRect);
        if (self.hg_imagePosition == HGButtonImagePositionRight) {
            CGFloat imageX =   CGRectGetMaxX(titleRect) - CGRectGetWidth(imageRect);
            imageRect = CGRectMake(imageX, CGRectGetMinY(imageRect), CGRectGetWidth(imageRect), CGRectGetHeight(imageRect));
        }else if (self.hg_imagePosition == HGButtonImagePositionTop){
            CGFloat y =  (contentH - (titleH + imageH + 4)) / 2;
            imageRect = CGRectMake((CGRectGetWidth(contentRect) - CGRectGetWidth(imageRect))/2, y, CGRectGetWidth(imageRect), CGRectGetHeight(imageRect));
        }else if (self.hg_imagePosition == HGButtonImagePositionBottom){
            
            CGFloat y =  ( contentH - imageH + titleH + 4)/2;
            imageRect = CGRectMake((CGRectGetWidth(contentRect) - CGRectGetWidth(imageRect))/2, y, CGRectGetWidth(imageRect), CGRectGetHeight(imageRect));
        }
    }
    
    
    return imageRect;
}
- (CGRect)hg_position_contentRectForBounds:(CGRect)bounds{
   
    return [self hg_position_contentRectForBounds:bounds];
}


@end


