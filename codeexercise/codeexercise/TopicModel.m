//
//  Topic.m
//  codeexercise
//
//  Created by Rashidul Hasan on 5/30/17.
//  Copyright © 2017 Rashidul Hasan. All rights reserved.
//

#import "TopicModel.h"

@implementation TopicModel

/**
 * comparing two topic object. It will be used by the sorting algorithm. First, the object will be compared with the upvote. If upvote is equal in both objects, the timestamp is considered to compare
 */

- (NSComparisonResult)compare:(id)otherTopic
{
    if([self upvote] == [otherTopic upvote]){
        return ([self timestamp] > [otherTopic timestamp]) ? NSOrderedDescending : NSOrderedAscending;
    }
    else if([self upvote] > [otherTopic upvote]){
        return NSOrderedDescending;
    }
    else{
        return NSOrderedAscending;
    }
}

@end
