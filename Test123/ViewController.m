//
//  ViewController.m
//  Test123
//
//  Created by Design Academy 5 on 4/22/15.
//  Copyright (c) 2015 Design Academy 5. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "City.h"
#import "AppDelegate.h"
#import "DAONews.h"

#import "MWFeedParser.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labela;

@property (assign) NSInteger i;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   

    
}


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





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)button1:(id)sender {
    
    //1.
     [self parseRSS];
    
    
    
    
    
    
//    self.labela.text = @"A";
//    
//    self.managedObjectContext = [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
//    
//    User *u = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectContext];
//    u.userid = [NSNumber numberWithInt:2];
//    u.username = @"zzzzzzz aaaa";
//    
//    
//    City *c = [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:self.managedObjectContext];
//    c.cityid = [NSNumber numberWithInt:2];
//    c.cityName = @"AAA";
//    c.zip = [NSNumber numberWithInt:1000];
//    
//    u.city = c;
//  
//    [c addUsersObject:u];
//    [self.managedObjectContext save:nil];
//    
//    //
//    NSEntityDescription *tmp = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
//    NSFetchRequest *r = [[NSFetchRequest alloc]init];
//    [r setEntity:tmp];
//    
//    NSPredicate *p = [NSPredicate predicateWithFormat:@"username == 'zz aaaa'"];
//    //[r setPredicate:p];
//    
//    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"username" ascending:YES];
//
//    [r setSortDescriptors:@[sort]];
//    
//    NSArray *result = [self.managedObjectContext executeFetchRequest:r error:nil];
//    for (User *userrr in result) {
//        NSLog(@"trt %@",[userrr valueForKey:@"username"]);
//    }
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
        
        [self.db executeUpdate:@"insert into New1 Values(title)",dao.title ];

        NSLog(@"==================");
//        FMResultSet *result = [self.db executeQuery:@"select * from Maja"];
//        while ([result next]) {
//            NSLog(@" %d",[result intForColumn:@"id"]);
//            NSLog(@" %@",[result stringForColumn:@"username"]);
//        }
    
        [self.db close];
}

@end
