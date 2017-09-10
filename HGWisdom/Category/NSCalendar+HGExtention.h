//
//  NSCalendar+HGExtention.h
//  UICollectionViewDemo
//
//  Created by 小雨很美 on 2017/5/15.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface NSCalendar (HGExtention)
- (nullable NSDate *)hg_firstDayOfMonth:(NSDate *)month;
- (nullable NSDate *)hg_lastDayOfMonth:(NSDate *)month;
- (nullable NSDate *)hg_firstDayOfWeek:(NSDate *)week;
- (nullable NSDate *)hg_lastDayOfWeek:(NSDate *)week;
- (nullable NSDate *)hg_middleDayOfWeek:(NSDate *)week;
- (NSInteger)hg_numberOfDaysInMonth:(NSDate *)month;
@end
NS_ASSUME_NONNULL_END
