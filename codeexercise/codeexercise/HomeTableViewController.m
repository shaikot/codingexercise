//
//  HomeTableViewController.m
//  codeexercise
//
//  Created by Rashidul Hasan on 5/31/17.
//  Copyright © 2017 Rashidul Hasan. All rights reserved.
//

#import "HomeTableViewController.h"
#import "TopicTableViewCell.h"
#import "Constants.h"
#import "TopicsManager.h"
#import "UIUtils.h"

#define MaxNumberTopicsInHomepage       20

@interface HomeTableViewController ()
@property (nonatomic, strong) NSArray *arrayList;
- (void) updateTableView;
@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *postTopicButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(postTopicButtonTapped:)];
    self.navigationItem.rightBarButtonItem = postTopicButton;

    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 140;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTableView) name:kNotificationUpdateTopicsTableViewControllerUpdateTableView object:nil];
}

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //Updating tableview with new data
    [self updateTableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_arrayList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TopicTableViewCell *cell = (TopicTableViewCell*) [tableView dequeueReusableCellWithIdentifier:[TopicTableViewCell reusuableIdentifier] forIndexPath:indexPath];
    NSUInteger rowIndex = [indexPath row];
    [cell updateViewWithTopic:[_arrayList objectAtIndex:rowIndex]];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) updateTableView{
    _arrayList = [[TopicsManager sharedInstance] getKLargetUpvotedSortingList:MaxNumberTopicsInHomepage];
    [self.tableView reloadData];
}

#pragma mark - IBAction
-(IBAction)postTopicButtonTapped :(id)sender {
    
    UIViewController* publishViewController =[[UIStoryboard storyboardWithName:kStoryBoardOne bundle:nil] instantiateViewControllerWithIdentifier:kViewControllerIDPublishViewController];
    [self presentViewController:publishViewController animated:YES completion:^{
        
    }];
    
}

#pragma dealloc
-(void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
