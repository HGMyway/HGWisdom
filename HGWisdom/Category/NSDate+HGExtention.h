//
//  NSDate+HGExtention.h
//  YonyouBanche
//
//  Created by 小雨很美 on 2017/4/26.
//  Copyright © 2017年 小雨很美. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HGExtention)
+(NSDate*)newSystemDate;
+(NSDate*)systemDate;
-(NSString *)descriptionWithFormate:(NSString*)formate;
@end
