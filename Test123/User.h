//
//  User.h
//  Test123
//
//  Created by Design Academy 5 on 4/22/15.
//  Copyright (c) 2015 Design Academy 5. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class City;

@interface User : NSManagedObject

@property (nonatomic, retain) NSNumber * userid;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) City *city;

@end
