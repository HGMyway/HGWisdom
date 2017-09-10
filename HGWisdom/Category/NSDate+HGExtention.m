//
//  NSDate+HGExtention.m
//  YonyouBanche
//
//  Created by 小雨很美 on 2017/4/26.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import "NSDate+HGExtention.h"

@implementation NSDate (HGExtention)
+(NSDate*)systemDate
{
    return [self newSystemDate];
}
+(NSDate*)newSystemDate
{
    NSDate *date = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    return localeDate;
}
-(NSString *)descriptionWithFormate:(NSString*)formateStr
{
    if (formateStr.length == 0) {
        formateStr = @"yyyy-MM-dd HH:mm:ss";
    }
    NSDateFormatter * format = [[NSDateFormatter alloc] init];
//    [format setDateStyle:NSDateFormatterMediumStyle];
//    [format setTimeStyle:NSDateFormatterShortStyle];
    [format setDateFormat:formateStr];
    return  [format stringFromDate:self];
}
@end
