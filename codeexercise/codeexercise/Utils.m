//
//  Utils.m
//  codeexercise
//
//  Created by Rashidul Hasan on 5/30/17.
//  Copyright © 2017 Rashidul Hasan. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(NSUInteger) timestampInMilliseconds{
    return [[NSDate date] timeIntervalSince1970] * 1000;
}

+(NSString*) numberFormat:(NSNumber*)number
{
    if (!number){
        return @"";
    }
    long long num = [number longLongValue];
    
    int s = ( (num < 0) ? -1 : (num > 0) ? 1 : 0 );
    NSString* sign = (s == -1 ? @"-" : @"" );
    num = llabs(num);
    if (num < 1000)
        return [NSString stringWithFormat:@"%@%lld",sign,num];
    int exp = (int) (log10l(num) / 3.f); //log10l(1000));
    NSArray* units = @[@"K",@"M",@"G",@"T",@"P",@"E"];
    return [NSString stringWithFormat:@"%@%.1f%@",sign, (num / pow(1000, exp)), [units objectAtIndex:(exp-1)]];
}

@end
