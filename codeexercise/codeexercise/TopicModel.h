//
//  Topic.h
//  codeexercise
//
//  Created by Rashidul Hasan on 5/30/17.
//  Copyright © 2017 Rashidul Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopicModel : NSObject

@property (nonnull, nonatomic, copy) NSString *userName;
@property (nonnull, nonatomic, copy) NSString *text;
@property (nonatomic) int upvote;
@property (nonatomic) int downvote;
@property (nonatomic) NSUInteger timestamp;


- (void)incrementUpVote;
- (void)incrementDownVote;
- (NSComparisonResult)compare:(id _Nullable )otherTopic;


@end
