//
//  UserModel.h
//  codeexercise
//
//  Created by Rashidul Hasan on 5/30/17.
//  Copyright © 2017 Rashidul Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject
+ (instancetype _Nullable )sharedInstance;

@property (nonnull, nonatomic, copy) NSString* userName;

@end
