//
//  StartTableViewController.m
//  Test123
//
//  Created by Design Academy 5 on 4/29/15.
//  Copyright (c) 2015 Design Academy 5. All rights reserved.
//

#import "StartTableViewController.h"

@interface StartTableViewController ()

@end

@implementation StartTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"unreadNews";
    UnreadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"UnreadTableViewCell" owner:self options:nil];
        cell = (UnreadTableViewCell*)[cellArray objectAtIndex:0];
    }
    
    
    
    
    [cell updateCellWithTitle:@"test" newsImageView:nil isRead:NO];
    
    return cell;
}


#pragma mark - RSS


- (void) parseRSS
{
    NSURL *feedURL = [NSURL URLWithString:@"http://it.com.mk/category/vesti/it-mk/feed/"];
    MWFeedParser *feedParser = [[MWFeedParser alloc] initWithFeedURL:feedURL];
    feedParser.delegate = self;
    feedParser.feedParseType = ParseTypeItemsOnly;
    feedParser.connectionType = ConnectionTypeAsynchronously;
    [feedParser parse];
}



-(void)feedParser:(MWFeedParser *)parser didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError");
}

-(void)feedParser:(MWFeedParser *)parser didParseFeedInfo:(MWFeedInfo *)info
{
    NSLog(@"didParseFeedInfo");
}

-(void)feedParser:(MWFeedParser *)parser didParseFeedItem:(MWFeedItem *)item
{
    NSLog(@"didParseFeedItem  title:%@  description %@" ,item.title,item.description);
    
    DAONews *d = [[DAONews alloc]init];
    d.title = item.title;
    //d.link = item.link;
    d.link = [[[item enclosures] valueForKey:@"url"] objectAtIndex:0];
    d.content = item.content;
    d.descriptionn = item.description;
    d.pubDate = item.date;
    
    [self saveDaoObj:d];
    
}
-(void)feedParserDidFinish:(MWFeedParser *)parser
{
    NSLog(@"feedParserDidFinish");
}
-(void)feedParserDidStart:(MWFeedParser *)parser
{
    NSLog(@"feedParserDidStart");
}



-(void)displayImageView:(NSString*)linkot
{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0),^(void){
        
        NSData *dataImage = [NSData dataWithContentsOfURL:[NSURL URLWithString:linkot]];
        UIImage *newsImage = [UIImage imageWithData:dataImage];
        dispatch_async(dispatch_get_main_queue(), ^{
            //
            //[self.img1 setImage:newsImage];
        });
        
    });
    
}

-(void) saveDaoObj:(DAONews*)dao
{
    NSString *dbPath = [NSString stringWithFormat:@"%@/Documents/rss.db",NSHomeDirectory()];
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:dbPath]){
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"rss" ofType:@"db"];
        
        NSError *error = nil;
        [[NSFileManager defaultManager] copyItemAtPath:bundlePath toPath:dbPath error:&error];
        if(error){
            NSLog(@"error %@",error.localizedDescription);
        }
    }
    
    self.db = [FMDatabase databaseWithPath:dbPath];
    
    
    [self.db open];
    // create table 'News1'(id number, content varchar,imageURL varchar,description varchar,pubDate date,title varchar,isRead number);
    [self.db executeUpdate:@"insert into News1(title,content,imageURL,description,isRead) Values(?,?,?,?,?)", dao.title , dao.content , dao.link , dao.descriptionn,dao.isRead ];
    
    NSLog(@"============READ======");
    FMResultSet *result = [self.db executeQuery:@"select * from News1"];
    while ([result next]) {
        //NSLog(@" %d",[result intForColumn:@"id"]);
        NSLog(@" %@",[result stringForColumn:@"title"]);
        NSLog(@" %@",[result stringForColumn:@"imageURL"]);
    }
    
    [self.db close];
    
    [self displayImageView:dao.link];
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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

@end
