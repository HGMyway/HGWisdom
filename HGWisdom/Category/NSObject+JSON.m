//
//  NSObject+JSON.m
//  JianShang
//
//  Created by 小雨很美 on 2016/11/17.
//  Copyright © 2016年 小雨很美. All rights reserved.
//

#import "NSObject+JSON.h"



@implementation NSObject (JSON)

@end


@implementation NSDictionary (JSON)
-(NSString *)stringValue
{
    return  [[NSString alloc] initWithData:[self dataValue] encoding:NSUTF8StringEncoding];
}
-(NSData *)dataValue
{
    return  [NSJSONSerialization dataWithJSONObject:self
                                            options:NSJSONWritingPrettyPrinted error:nil];
}
@end



@implementation NSData (JSON)

- (NSDictionary *)jsonDataToDictError:(NSError **)error
{
    NSDictionary* dict = nil;
    if(self.length)
        dict = [NSJSONSerialization JSONObjectWithData:self options:kNilOptions error:error];
    else
        dict = [NSDictionary dictionary];
    return [dict isKindOfClass:[NSDictionary class]] ? dict : nil;
}

@end


@implementation NSString (JSON)

-(NSDictionary *)jsonStrToDictError:(NSError * *)error
{
    NSDictionary* dict =nil;

    if(self)
        dict = [[self dataUsingEncoding:NSUTF8StringEncoding] jsonDataToDictError:error];
    else
        dict = [NSDictionary dictionary];
    return dict;
}
@end
