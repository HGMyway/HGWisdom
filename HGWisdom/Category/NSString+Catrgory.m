//
//  NSString+Catrgory.m
//  JianShang
//
//  Created by 小雨很美 on 2016/11/23.
//  Copyright © 2016年 小雨很美. All rights reserved.
//

#import "NSString+Catrgory.h"

@implementation NSString (Catrgory)
-(NSArray*)toCharacterArray
{
    NSMutableArray * mArray = [NSMutableArray array];
    if ([self isKindOfClass:[NSString class]]) {
        for (NSInteger index = 0; index < self.length; index++) {
            [mArray addObject:[self substringWithRange:NSMakeRange(index, 1)]];
        }
    }
    return mArray;
}
@end

@implementation NSString (checkString)


-(BOOL)checkPhoneNumber
{
    NSString *phoneRegex = @"1[0-9]{10}";
    NSPredicate *phonePred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    if ([phonePred evaluateWithObject:self]) {
        return YES;
    }
    else
        return NO;
}

-(BOOL)checkEmailAddress
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailPred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if ([emailPred evaluateWithObject:self]) {
        return YES;
    }
    else
        return NO;
}

-(BOOL)checkIdentificationNumber
{
    //NSString *regex = @"(^[0-9X]{1,18}$)";
    NSString *idcardRegEx = @"(\\d{14}[0-9X])|(\\d{17}[0-9X])";
    NSPredicate *idcardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",idcardRegEx];
    return [idcardPredicate evaluateWithObject:self];
}

@end
