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

@end
