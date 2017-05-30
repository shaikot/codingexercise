//
//  TopicTableViewCell.m
//  codeexercise
//
//  Created by Rashidul Hasan on 5/31/17.
//  Copyright © 2017 Rashidul Hasan. All rights reserved.
//

#import "TopicTableViewCell.h"
#import "Constants.h"
#import "Utils.h"

@interface TopicTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *userNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *countLabel;
@property (nonatomic, weak) IBOutlet UILabel *topicLabel;
@property (nonatomic, weak) IBOutlet UIButton *upvoteButton;
@property (nonatomic, weak) IBOutlet UIButton *downvoteButton;
@property (nonatomic, strong) TopicModel *topic;
@end

@implementation TopicTableViewCell

+ (NSString*) reusuableIdentifier{
    return @"topicReusableIdentifier";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void) updateViewWithTopic:(TopicModel*) pTopic{
    self.topic = pTopic;
    [self.userNameLabel setText:self.topic.userName];
    [self.topicLabel setText:self.topic.text];
    [self.countLabel setText:@"0"];
    int vote = self.topic.upvote - self.topic.downvote;
    if(vote > 0){
        //As per reddit implementation, it does not want to show negative numbers.
        [self.countLabel setText:[Utils numberFormat:[NSNumber numberWithInteger:vote]]];
    }
}

- (IBAction)upvoteButtonPressed:(id)sender{
    [self.topic incrementUpVote];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationUpdateTopicsTableViewControllerUpdateTableView object:nil userInfo:nil];
}

- (IBAction)downvoteButtonPressed:(id)sender{
    [self.topic incrementDownVote];
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationUpdateTopicsTableViewControllerUpdateTableView object:nil userInfo:nil];
}

@end
