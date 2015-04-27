//
//  ViewController.h
//  Test123
//
//  Created by Design Academy 5 on 4/22/15.
//  Copyright (c) 2015 Design Academy 5. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property ( strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property ( strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property ( strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


@end

