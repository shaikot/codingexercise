//
//  PublishViewController.m
//  codeexercise
//
//  Created by Rashidul Hasan on 5/31/17.
//  Copyright © 2017 Rashidul Hasan. All rights reserved.
//

#import "PublishViewController.h"
#import "TopicsManager.h"
#import "Constants.h"

@interface PublishViewController ()
@property (nonatomic, weak) IBOutlet UITextView *topicTextView;
@property (nonatomic, weak) IBOutlet UILabel *displayNumberCharactersLabel;
@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma IBAction handlers

- (IBAction)publishButtonPressed:(id)sender{
    
    [[TopicsManager sharedInstance] addaTopic:_topicTextView.text];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationUpdateTopicsTableViewControllerUpdateTableView object:nil userInfo:nil];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma textView delegate method

- (void)textViewDidChange:(UITextView *)textView{
    NSUInteger length = [[textView text] length];
    [self.displayNumberCharactersLabel setText:[NSString stringWithFormat:@"%lu",length]];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return textView.text.length + (text.length - range.length) <= 255;
}

@end
