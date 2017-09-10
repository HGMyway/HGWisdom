//
//  NSString+Catrgory.h
//  JianShang
//
//  Created by 小雨很美 on 2016/11/23.
//  Copyright © 2016年 小雨很美. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Catrgory)
-(NSArray*)toCharacterArray;
@end

@interface NSString (checkString)

-(BOOL)checkPhoneNumber;
-(BOOL)checkEmailAddress;
-(BOOL)checkIdentificationNumber;
@end
