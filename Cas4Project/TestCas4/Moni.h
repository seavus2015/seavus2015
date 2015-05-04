//
//  Moni.h
//
//  Created by Dejan Krstevski on 5/4/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Moni : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *fcodeName;
@property (nonatomic, strong) NSString *wikipedia;
@property (nonatomic, assign) double population;
@property (nonatomic, assign) double geonameId;
@property (nonatomic, strong) NSString *fclName;
@property (nonatomic, strong) NSString *countrycode;
@property (nonatomic, assign) double lat;
@property (nonatomic, strong) NSString *fcode;
@property (nonatomic, strong) NSString *toponymName;
@property (nonatomic, assign) double lng;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *fcl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
