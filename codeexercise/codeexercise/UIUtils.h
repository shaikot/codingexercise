//
//  UIUtils.h
//  codeexercise
//
//  Created by Mirfat on 5/30/17.
//  Copyright © 2017 Rashidul Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kStoryBoardOne @"Main"

#define kViewControllerIDPublishViewController     @"publishViewControllerID"
#define kViewControllerHomeTableViewController     @"homeTableViewControllerID"

@interface UIUtils : NSObject

+(void)showAlertWithMessage:(NSString*) message title:(NSString*) title doneButtonText:(NSString*)doneText viewController:(UIViewController*) viewController;

@end
