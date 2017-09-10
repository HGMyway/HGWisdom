//
//  UIScrollView+ContentOffSet.h
//  JianShang
//
//  Created by 小雨很美 on 2016/11/12.
//  Copyright © 2016年 小雨很美. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (ContentOffSet)


/**
 获取水平方向的page

 @return <#return value description#>
 */
-(NSInteger)verticalIndexOfScrollPage;

/**
 获取垂直方向的page

 @return <#return value description#>
 */
-(NSInteger)horizontalIndexOfScrollPage;
@end
