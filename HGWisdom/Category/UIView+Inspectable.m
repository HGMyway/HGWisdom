//
//  UIView+Inspectable.m
//  JianShang
//
//  Created by 小雨很美 on 2016/11/3.
//  Copyright © 2016年 小雨很美. All rights reserved.
//

#import "UIView+Inspectable.h"

@implementation UIView (Inspectable)

- (void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius>0;
}

- (CGFloat)cornerRadius{
    return self.layer.cornerRadius;
}



- (void)setBorderColor:(UIColor *)borderColor{
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor{

    return [UIColor colorWithCGColor:self.layer.borderColor];
}


- (void)setBorderWidth:(CGFloat)borderWidth{
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth{
    return self.layer.borderWidth;
}

@end
@implementation UITextField(customStyle)
-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    [self setValue:placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
}
-(UIColor *)placeholderColor
{
    return [self valueForKeyPath:@"_placeholderLabel.textColor" ];

}


@end
