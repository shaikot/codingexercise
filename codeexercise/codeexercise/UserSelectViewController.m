//
//  ViewController.m
//  codeexercise
//
//  Created by Rashidul Hasan on 5/30/17.
//  Copyright © 2017 Rashidul Hasan. All rights reserved.
//

#import "UserSelectViewController.h"
#import "UIUtils.h"
#import "UserModel.h"

@interface UserSelectViewController ()<UITextFieldDelegate>
@property (nonatomic, weak) IBOutlet UITextField *userNameField;
@end

@implementation UserSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];   //it hides
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if([[[UserModel sharedInstance] userName] length] > 0){
        [_userNameField setPlaceholder:[NSString stringWithFormat:@"%@, try another username.", [[UserModel sharedInstance] userName]]];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES]; // it shows
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma textField delegate

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma IBAction section

- (IBAction)enterButtonPressed:(id)sender{
    NSString *userName = [[UserModel sharedInstance] userName];
    if([[_userNameField text] length] > 0){
        userName = [_userNameField text];
        [[UserModel sharedInstance] setUserName:[_userNameField text]];
        [_userNameField setText:@""];
    }
    if(userName){
        UIViewController* homeTableViewController =[[UIStoryboard storyboardWithName:kStoryBoardOne bundle:nil] instantiateViewControllerWithIdentifier:kViewControllerHomeTableViewController];
        [self.navigationController pushViewController:homeTableViewController animated: YES];
    }else{
        [UIUtils showAlertWithMessage:@"Please enter a username." title:@"" doneButtonText:@"Ok" viewController:self];
    }
}

@end
