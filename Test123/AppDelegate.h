//
//  AppDelegate.h
//  Test123
//
//  Created by Design Academy 5 on 4/22/15.
//  Copyright (c) 2015 Design Academy 5. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "ViewController.h"
#import "MainViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


@property (strong,nonatomic) MainViewController *main;

@property (strong,nonatomic) ViewController *mainVC;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

