//
//  City.h
//  Test123
//
//  Created by Design Academy 5 on 4/22/15.
//  Copyright (c) 2015 Design Academy 5. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface City : NSManagedObject

@property (nonatomic, retain) NSNumber * cityid;
@property (nonatomic, retain) NSString * cityName;
@property (nonatomic, retain) NSNumber * zip;
@property (nonatomic, retain) NSSet *users;
@end

@interface City (CoreDataGeneratedAccessors)

- (void)addUsersObject:(User *)value;
- (void)removeUsersObject:(User *)value;
- (void)addUsers:(NSSet *)values;
- (void)removeUsers:(NSSet *)values;

@end
