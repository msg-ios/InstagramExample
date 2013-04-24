//
//  InstagramDemoViewController.m
//  InstagramExample
//
//  Created by Marco S. Graciano on 4/24/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import "InstagramDemoViewController.h"

@interface InstagramDemoViewController ()

@property (nonatomic, retain) NSArray *followedByArray;

@end

@implementation InstagramDemoViewController
@synthesize followedByArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[[RMMasterSDK InstagramSDK] authorizeWithScopes:[NSArray arrayWithObjects:@"relationships", nil]];
    
    
    //TEST BY COMMENT-UNCOMMENT THE FOLLOWING LINES
    
    [[RMMasterSDK InstagramSDK] getFollowedByWithUserId:@"self" AndWithDelegate:self];
    
    // [[RMMasterSDK InstagramSDK] getFollowsWithUserId:@"self" AndWithDelegate:self];
    
    //[[RMMasterSDK InstagramSDK] getUserInfoWithUserID:@"self" AndWithDelegate:self];
    
    //[[RMMasterSDK InstagramSDK] getRequestedByWithDelegate:self];
    
    //[[RMMasterSDK InstagramSDK] getRelationshipWithUserID:@"38736160" AndWithDelegate:self];
    
    // [[RMMasterSDK InstagramSDK] postRelationshipWithAction:@"follow" UserId:@"224680885" AndWithDelegate:self];
    
    //  NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"2",@"count", nil];
    
    //[[RMMasterSDK InstagramSDK] getAuthenticatedUserFeedWithParameters:params AndWithDelegate:self];
    
    //[[RMMasterSDK InstagramSDK] getUserMediaWithUserID:@"31628480" Parameters:params AndWithDelegate:self];
    
    //[[RMMasterSDK InstagramSDK] getAuthenticatedUserLikedMediaWithParameters:params AndWithDelegate:self];
    
    //  [[RMMasterSDK InstagramSDK] searchUserWithQuery:@"Red Bull" AndWithDelegate:self];
    
    /* NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"48.858844", @"lat", @"2.294351", @"lng", @"5000", @"distance",nil];
     
     [[RMMasterSDK InstagramSDK] getMediaSearchWithParams:params AndWithDelegate:self];*/
    
    //  [[RMMasterSDK InstagramSDK] getMediaWithMediaID:@"392743925499176680_38736160" AndWithDelegate:self];
    
    // [[RMMasterSDK InstagramSDK] getLikesOfMediaId:@"392743925499176680_38736160" AndWithDelegate:self];
    
    // [[RMMasterSDK InstagramSDK] authorizeWithScopes:[NSArray arrayWithObjects:@"likes", nil]];
    
    // [[RMMasterSDK InstagramSDK] postLikeOnMediaWithMediaId:@"392743925499176680_38736160" AndWithDelegate:self];
    
    // [[RMMasterSDK InstagramSDK] removeLikeOnMediaWithMediaId:@"392743925499176680_38736160" AndWithDelegate:self];
    
    // [[RMMasterSDK InstagramSDK] getTagInfoWithTagName:@"boring" AndWithDelegate:self];
    
    //[[RMMasterSDK InstagramSDK] getSearchTagsWithTagName:@"snowy" AndWithDelegate:self];
    
    //  [[RMMasterSDK InstagramSDK] getRecentTags:@"snowly" WithParams:nil AndWithDelegate:self];
    
    //[[RMMasterSDK InstagramSDK] getPopularMediaWithDelegate:self];
    
    //[[RMMasterSDK InstagramSDK] postCommentWithMediaID:@"392743925499176680_38736160" Text:@"hola" AndWithDelegate:self];
    
    //[[RMMasterSDK InstagramSDK] getCommentsWithMediaID:@"392743925499176680_38736160" AndWithDelegate:self];
    
    //[[RMMasterSDK InstagramSDK] deleteCommentWithCommentID:@"" MediaID:@"392743925499176680_38736160" AndWithDelegate:self];
    
    // [[RMMasterSDK InstagramSDK] getLocationInfoWithLocationID:@"52029886" AndWithDelegate:self];
    
    // [[RMMasterSDK InstagramSDK] getLocationRecentMediaWithLocationID:@"52029886" Parameters:nil AndWithDelegate:self];
    
    // NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"-34.56809528990158", @"lat", @"-58.44405770301819", @"lng", nil];
    // [[RMMasterSDK InstagramSDK] searchLocationWithParameters:params AndWithDelegate:self];
    
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleBordered target:self action:@selector(performLogout)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(followedByArray.count > 0)
        return [followedByArray count];
    else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
    if (followedByArray.count > 0) {
        cell.textLabel.text = [[self.followedByArray objectAtIndex:indexPath.row] objectForKey:@"username"];
    } else
    {
        cell.textLabel.text = @"You don't have followers";
    }
    
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void)performLogout{
    [[RMMasterSDK InstagramSDK] logout];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - InstagramRequestsDelegate

-(void)loadFollowedByWithArray:(NSArray *)array {
    self.followedByArray = array;
    NSLog(@"Array!: %@", self.followedByArray);
    [self.tableView reloadData];
    
}

@end
