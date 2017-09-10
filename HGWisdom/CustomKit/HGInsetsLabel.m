

//
//  HGInsetsLabel.m
//  TPSApp
//
//  Created by 小雨很美 on 2017/5/31.
//  Copyright © 2017年 YY. All rights reserved.
//

#import "HGInsetsLabel.h"

@implementation HGInsetsLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect rect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    rect.size.width  += (self.insets.left + self.insets.right);
    rect.size.height += (self.insets.top  + self.insets.bottom);
    return  rect;
}

- (void)drawTextInRect:(CGRect)rect
{
    return  [super  drawTextInRect:UIEdgeInsetsInsetRect(rect, self.insets)];
}

@end
