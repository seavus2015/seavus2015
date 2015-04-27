//
//  MainViewController.h
//  Test123
//
//  Created by Design Academy 5 on 4/27/15.
//  Copyright (c) 2015 Design Academy 5. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <sqlite3.h>
#import "FMDB.h"

@interface MainViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end
