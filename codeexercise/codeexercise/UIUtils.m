//
//  UIUtils.m
//  codeexercise
//
//  Created by Mirfat on 5/30/17.
//  Copyright © 2017 Rashidul Hasan. All rights reserved.
//

#import "UIUtils.h"

@implementation UIUtils

+(void)showAlertWithMessage:(NSString*) message title:(NSString*) title doneButtonText:(NSString*)doneText viewController:(UIViewController*) viewController{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:doneText style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
    }];
    
    [alert addAction:defaultAction];
    [viewController presentViewController:alert animated:YES completion:nil];
}

@end
