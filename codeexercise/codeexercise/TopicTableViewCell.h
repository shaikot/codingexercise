//
//  TopicTableViewCell.h
//  codeexercise
//
//  Created by Rashidul Hasan on 5/31/17.
//  Copyright © 2017 Rashidul Hasan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopicTableViewCell : UITableViewCell

/**
 * Reusuable Identifier has been defined here. Please note that same the identifier is used in storyboard. Anychange should be reflected on both place.
 */

+ (NSString*) reusuableIdentifier;

/**
 * Update the cell with data.
 */
-(void) updateView;


@end
