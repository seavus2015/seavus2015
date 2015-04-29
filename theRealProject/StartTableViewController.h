//
//  StartTableViewController.h
//  Test123
//
//  Created by Design Academy 5 on 4/29/15.
//  Copyright (c) 2015 Design Academy 5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWFeedParser.h"
#import "FMDB.h"
#import "User.h"
#import "City.h"
#import "DAONews.h"
#import "UnreadTableViewCell.h"


@interface StartTableViewController : UITableViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) FMDatabase *db;


@end
