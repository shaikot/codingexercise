//
//  TopicTableViewCell.m
//  codeexercise
//
//  Created by Rashidul Hasan on 5/31/17.
//  Copyright © 2017 Rashidul Hasan. All rights reserved.
//

#import "TopicTableViewCell.h"

@interface TopicTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *userNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *countLabel;
@property (nonatomic, weak) IBOutlet UILabel *topicLabel;
@property (nonatomic, weak) IBOutlet UIButton *upvoteButton;
@property (nonatomic, weak) IBOutlet UIButton *downvoteButton;
//@property (nonatomic, strong) Topic *topic;
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

-(void) updateView{
    [self.userNameLabel setText:@"shakib"];
    [self.topicLabel setText:@"sdfjklsd 0948098r0q"];
    //todo::
    int vote = 0;//self.topic.upvote - self.topic.downvote;
    [self.countLabel setText:[NSString stringWithFormat:@"%d",vote]];
}

- (IBAction)upvoteButtonPressed:(id)sender{
//    [self.topic setUpvote:self.topic.upvote +1];
//    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationUpdateTopicsTableViewControllerUpdateTableView object:nil userInfo:nil];
}

- (IBAction)downvoteButtonPressed:(id)sender{
//    [self.topic setDownvote:self.topic.downvote +1];
//    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationUpdateTopicsTableViewControllerUpdateTableView object:nil userInfo:nil];
}


@end
