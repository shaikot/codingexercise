//
//  UserModel.m
//  codeexercise
//
//  Created by Rashidul Hasan on 5/30/17.
//  Copyright © 2017 Rashidul Hasan. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel


+ (instancetype)sharedInstance {
    static UserModel *sharedModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedModel = [self new];
    });
    return sharedModel;
}

@end
