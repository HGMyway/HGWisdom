//
//  NSCalendar+HGExtention.m
//  UICollectionViewDemo
//
//  Created by 小雨很美 on 2017/5/15.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import "NSCalendar+HGExtention.h"
#import <objc/runtime.h>
@interface NSCalendar (HGExtentionPricate)

@property (readonly, nonatomic) NSDateComponents *hg_privateComponents;
@end
@implementation NSCalendar (HGExtention)
-(NSDate *)hg_firstDayOfMonth:(NSDate *)month
{
    if (!month) return nil;
    NSDateComponents * components = [self components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour  fromDate:month];
    components.day = 1;
    return [self dateFromComponents:components];
}
- (nullable NSDate *)hg_lastDayOfMonth:(NSDate *)month
{
    if (!month) return nil;
    NSDateComponents *components = [self components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour fromDate:month];
    components.month++;
    components.day = 0;
    return [self dateFromComponents:components];
}
-(NSDate *)hg_firstDayOfWeek:(NSDate *)week
{
    if(!week) return nil;
    NSDateComponents * weekdayComponents = [self components:NSCalendarUnitWeekday fromDate:week];
    NSDateComponents * components =  self.hg_privateComponents;
    components.day =- weekdayComponents.weekday - self.firstWeekday;
    components.day = (components.day - 7) %7;
    NSDate * firstDayOfWeek = [self dateByAddingComponents:components toDate:week options:0];
    firstDayOfWeek = [self dateBySettingHour:0 minute:0 second:0 ofDate:firstDayOfWeek options:0];
    return firstDayOfWeek;
}

- (nullable NSDate *)hg_lastDayOfWeek:(NSDate *)week
{
    if (!week) return nil;
    NSDateComponents *weekdayComponents = [self components:NSCalendarUnitWeekday fromDate:week];
    NSDateComponents *components = self.hg_privateComponents;
    components.day = - (weekdayComponents.weekday - self.firstWeekday);
    components.day = (components.day-7) % 7 + 6;
    NSDate *lastDayOfWeek = [self dateByAddingComponents:components toDate:week options:0];
    lastDayOfWeek = [self dateBySettingHour:0 minute:0 second:0 ofDate:lastDayOfWeek options:0];
    components.day = NSIntegerMax;
    return lastDayOfWeek;
}

- (nullable NSDate *)hg_middleDayOfWeek:(NSDate *)week
{
    if (!week) return nil;
    NSDateComponents *weekdayComponents = [self components:NSCalendarUnitWeekday fromDate:week];
    NSDateComponents *componentsToSubtract = self.hg_privateComponents;
    componentsToSubtract.day = - (weekdayComponents.weekday - self.firstWeekday) + 3;
    NSDate *middleDayOfWeek = [self dateByAddingComponents:componentsToSubtract toDate:week options:0];
    NSDateComponents *components = [self components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour fromDate:middleDayOfWeek];
    middleDayOfWeek = [self dateFromComponents:components];
    componentsToSubtract.day = NSIntegerMax;
    return middleDayOfWeek;
}

- (NSInteger)hg_numberOfDaysInMonth:(NSDate *)month
{
    if (!month) return 0;
    NSRange days = [self rangeOfUnit:NSCalendarUnitDay
                              inUnit:NSCalendarUnitMonth
                             forDate:month];
    return days.length;
}

-(NSDateComponents *)hg_privateComponents
{
    NSDateComponents *components = objc_getAssociatedObject(self, _cmd);
    if (!components) {
        components = [[NSDateComponents alloc] init];
        objc_setAssociatedObject(self, _cmd, components, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return components;
}
@end
