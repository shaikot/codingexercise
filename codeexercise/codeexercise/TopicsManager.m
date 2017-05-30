//
//  TopicsManager.m
//  codeexercise
//
//  Created by Rashidul Hasan on 5/30/17.
//  Copyright © 2017 Rashidul Hasan. All rights reserved.
//

#import "TopicsManager.h"
#import "UserModel.h"
#import "Utils.h"
#import "MCBinaryHeap.h"
#import "TopicModel.h"

@interface TopicsManager ()
// The list will contain the topics published by the users.
@property (nonatomic, strong) NSMutableArray *list;

- (NSArray*) sortUsingBinaryHeap:(int) k;
@end

@implementation TopicsManager

+ (instancetype)sharedInstance {
    static TopicsManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [self new];
    });
    return sharedManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _list = [NSMutableArray array];
    }
    return self;
}


/**
 * Add a topic to the list
 */

-(void) addaTopic:(NSString*) topicText{
    if(topicText == nil || [topicText length] == 0){
        return;
    }
    NSString *trimmedTopicText = [topicText stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceCharacterSet]];
    if([trimmedTopicText length] > 0){
        TopicModel *topicModel = [TopicModel new];
        [topicModel setUserName:[[UserModel sharedInstance] userName]];
        [topicModel setText:trimmedTopicText];
        [topicModel setTimestamp:[Utils timestampInMilliseconds]];
        [_list addObject:topicModel];
    }
}

/**
 *  Find k largest elements from the list.
 */

-(NSArray*) getKLargetUpvotedSortingList:(int) k{
    return [self sortUsingBinaryHeap:k];
}


/**
 * priority queue (minHeap) to find the k most upvoted topics.
 *
 */

- (NSArray*) sortUsingBinaryHeap:(int) k{
    NSMutableArray *sortedList = [NSMutableArray array];
    MCBinaryHeap *binaryHeap = [[MCBinaryHeap alloc] init];
    int index = 0;
    for (id object in _list) {
        if(index < k){
            [binaryHeap addObject:object];
        }else{
            TopicModel *minTopic = [binaryHeap minimumObject];
            TopicModel *topic = (TopicModel*) object;
            if([topic compare:minTopic] == NSOrderedDescending){
                [binaryHeap removeMinimumObject];
                [binaryHeap addObject:object];
            }
        }
        index++;
    }
    [binaryHeap enumerateObjectsUsingBlock:^(id object) {
        [sortedList insertObject:object atIndex:0];
    }];
    return sortedList;
}



@end
