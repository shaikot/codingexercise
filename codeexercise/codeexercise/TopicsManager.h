//
//  TopicsManager.h
//  codeexercise
//
//  Created by Rashidul Hasan on 5/30/17.
//  Copyright © 2017 Rashidul Hasan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TopicsManager : NSObject

/**
 * The shared method of this object
 */

+ (instancetype)sharedInstance;
/**
 *  Add a topic to list
 */
-(void) addaTopic:(NSString*) topicText;

/**
 *  Find k largest elements from the list.
 */
-(NSArray*) getKLargetUpvotedSortingList:(int) k;



@end
