//
//  ViewController.m
//  codeexercise
//
//  Created by Rashidul Hasan on 5/30/17.
//  Copyright © 2017 Rashidul Hasan. All rights reserved.
//

#import "UserSelectViewController.h"

@interface UserSelectViewController ()
@property (nonatomic, weak) IBOutlet UIButton *enterButton;
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

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES]; // it shows
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)enterButtonPressed:(id)sender{
    if([[_userNameField text] length] > 0){
//        [[UserModel sharedInstance] setUserName:[_userNameField text]];
        UIViewController* homeTableViewController =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"homeTableViewControllerID"];
        [self.navigationController pushViewController:homeTableViewController animated: YES];
    }
}

@end
