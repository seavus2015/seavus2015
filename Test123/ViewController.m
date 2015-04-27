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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labela;

@property (assign) NSInteger i;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)button1:(id)sender {
    
    self.labela.text = @"A";
    
    self.managedObjectContext = [(AppDelegate*)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    User *u = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    u.userid = [NSNumber numberWithInt:2];
    u.username = @"zzzzzzz aaaa";
    
    
    City *c = [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:self.managedObjectContext];
    c.cityid = [NSNumber numberWithInt:2];
    c.cityName = @"AAA";
    c.zip = [NSNumber numberWithInt:1000];
    
    u.city = c;
  
    [c addUsersObject:u];
    [self.managedObjectContext save:nil];
    
    //
    NSEntityDescription *tmp = [NSEntityDescription entityForName:@"User" inManagedObjectContext:self.managedObjectContext];
    NSFetchRequest *r = [[NSFetchRequest alloc]init];
    [r setEntity:tmp];
    
    NSPredicate *p = [NSPredicate predicateWithFormat:@"username == 'zz aaaa'"];
    //[r setPredicate:p];
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"username" ascending:YES];

    [r setSortDescriptors:@[sort]];
    
    NSArray *result = [self.managedObjectContext executeFetchRequest:r error:nil];
    for (User *userrr in result) {
        NSLog(@"trt %@",[userrr valueForKey:@"username"]);
    }
}

@end
