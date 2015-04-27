//
//  MainViewController.m
//  Test123
//
//  Created by Design Academy 5 on 4/27/15.
//  Copyright (c) 2015 Design Academy 5. All rights reserved.
//

#import "MainViewController.h"
#import "UnreadTableViewCell.h"

@interface MainViewController ()

@property (strong,nonatomic) FMDatabase *db;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    NSString *dbPath = [NSString stringWithFormat:@"%@/Documents/moni.db",NSHomeDirectory()];
    //
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:dbPath]){
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"moni" ofType:@"db"];
        
        NSError *error = nil;
        [[NSFileManager defaultManager] copyItemAtPath:bundlePath toPath:dbPath error:&error];
        if(error){
            NSLog(@"error %@",error.localizedDescription);
        }
    }
    
    self.db = [FMDatabase databaseWithPath:dbPath];
    
    
    [self.db open];
    
    [self.db executeUpdate:@"insert into Maja Values(?,?)",[NSNumber numberWithInt:1], @"maja" ];
    
    for (int i=0; i<10; i++) {
        [self.db executeUpdate:@"insert into Maja Values(?,?)",[NSNumber numberWithInt:i], @"maja" ];
    }
    
    
    NSLog(@"==================");
    FMResultSet *result = [self.db executeQuery:@"select * from Maja"];
    while ([result next]) {
        NSLog(@" %d",[result intForColumn:@"id"]);
        NSLog(@" %@",[result stringForColumn:@"username"]);
    }
    
    [self.db close];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 300;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 170;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
