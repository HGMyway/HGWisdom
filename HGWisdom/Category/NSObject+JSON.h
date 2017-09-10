//
//  NSObject+JSON.h
//  JianShang
//
//  Created by 小雨很美 on 2016/11/17.
//  Copyright © 2016年 小雨很美. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JSON)

@end

@interface NSDictionary (JSON)
-(NSString*)stringValue;
-(NSData*)dataValue;
@end

@interface NSData (JSON)
- (NSDictionary *)jsonDataToDictError:(NSError **)error;

@end

@interface NSString (JSON)
-(NSDictionary *)jsonStrToDictError:(NSError * *)error;
@end

