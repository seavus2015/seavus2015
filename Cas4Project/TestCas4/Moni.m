//
//  Moni.m
//
//  Created by Dejan Krstevski on 5/4/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Moni.h"


NSString *const kMoniFcodeName = @"fcodeName";
NSString *const kMoniWikipedia = @"wikipedia";
NSString *const kMoniPopulation = @"population";
NSString *const kMoniGeonameId = @"geonameId";
NSString *const kMoniFclName = @"fclName";
NSString *const kMoniCountrycode = @"countrycode";
NSString *const kMoniLat = @"lat";
NSString *const kMoniFcode = @"fcode";
NSString *const kMoniToponymName = @"toponymName";
NSString *const kMoniLng = @"lng";
NSString *const kMoniName = @"name";
NSString *const kMoniFcl = @"fcl";


@interface Moni ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Moni

@synthesize fcodeName = _fcodeName;
@synthesize wikipedia = _wikipedia;
@synthesize population = _population;
@synthesize geonameId = _geonameId;
@synthesize fclName = _fclName;
@synthesize countrycode = _countrycode;
@synthesize lat = _lat;
@synthesize fcode = _fcode;
@synthesize toponymName = _toponymName;
@synthesize lng = _lng;
@synthesize name = _name;
@synthesize fcl = _fcl;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.fcodeName = [self objectOrNilForKey:kMoniFcodeName fromDictionary:dict];
            self.wikipedia = [self objectOrNilForKey:kMoniWikipedia fromDictionary:dict];
            self.population = [[self objectOrNilForKey:kMoniPopulation fromDictionary:dict] doubleValue];
            self.geonameId = [[self objectOrNilForKey:kMoniGeonameId fromDictionary:dict] doubleValue];
            self.fclName = [self objectOrNilForKey:kMoniFclName fromDictionary:dict];
            self.countrycode = [self objectOrNilForKey:kMoniCountrycode fromDictionary:dict];
            self.lat = [[self objectOrNilForKey:kMoniLat fromDictionary:dict] doubleValue];
            self.fcode = [self objectOrNilForKey:kMoniFcode fromDictionary:dict];
            self.toponymName = [self objectOrNilForKey:kMoniToponymName fromDictionary:dict];
            self.lng = [[self objectOrNilForKey:kMoniLng fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kMoniName fromDictionary:dict];
            self.fcl = [self objectOrNilForKey:kMoniFcl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.fcodeName forKey:kMoniFcodeName];
    [mutableDict setValue:self.wikipedia forKey:kMoniWikipedia];
    [mutableDict setValue:[NSNumber numberWithDouble:self.population] forKey:kMoniPopulation];
    [mutableDict setValue:[NSNumber numberWithDouble:self.geonameId] forKey:kMoniGeonameId];
    [mutableDict setValue:self.fclName forKey:kMoniFclName];
    [mutableDict setValue:self.countrycode forKey:kMoniCountrycode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lat] forKey:kMoniLat];
    [mutableDict setValue:self.fcode forKey:kMoniFcode];
    [mutableDict setValue:self.toponymName forKey:kMoniToponymName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lng] forKey:kMoniLng];
    [mutableDict setValue:self.name forKey:kMoniName];
    [mutableDict setValue:self.fcl forKey:kMoniFcl];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.fcodeName = [aDecoder decodeObjectForKey:kMoniFcodeName];
    self.wikipedia = [aDecoder decodeObjectForKey:kMoniWikipedia];
    self.population = [aDecoder decodeDoubleForKey:kMoniPopulation];
    self.geonameId = [aDecoder decodeDoubleForKey:kMoniGeonameId];
    self.fclName = [aDecoder decodeObjectForKey:kMoniFclName];
    self.countrycode = [aDecoder decodeObjectForKey:kMoniCountrycode];
    self.lat = [aDecoder decodeDoubleForKey:kMoniLat];
    self.fcode = [aDecoder decodeObjectForKey:kMoniFcode];
    self.toponymName = [aDecoder decodeObjectForKey:kMoniToponymName];
    self.lng = [aDecoder decodeDoubleForKey:kMoniLng];
    self.name = [aDecoder decodeObjectForKey:kMoniName];
    self.fcl = [aDecoder decodeObjectForKey:kMoniFcl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_fcodeName forKey:kMoniFcodeName];
    [aCoder encodeObject:_wikipedia forKey:kMoniWikipedia];
    [aCoder encodeDouble:_population forKey:kMoniPopulation];
    [aCoder encodeDouble:_geonameId forKey:kMoniGeonameId];
    [aCoder encodeObject:_fclName forKey:kMoniFclName];
    [aCoder encodeObject:_countrycode forKey:kMoniCountrycode];
    [aCoder encodeDouble:_lat forKey:kMoniLat];
    [aCoder encodeObject:_fcode forKey:kMoniFcode];
    [aCoder encodeObject:_toponymName forKey:kMoniToponymName];
    [aCoder encodeDouble:_lng forKey:kMoniLng];
    [aCoder encodeObject:_name forKey:kMoniName];
    [aCoder encodeObject:_fcl forKey:kMoniFcl];
}

- (id)copyWithZone:(NSZone *)zone
{
    Moni *copy = [[Moni alloc] init];
    
    if (copy) {

        copy.fcodeName = [self.fcodeName copyWithZone:zone];
        copy.wikipedia = [self.wikipedia copyWithZone:zone];
        copy.population = self.population;
        copy.geonameId = self.geonameId;
        copy.fclName = [self.fclName copyWithZone:zone];
        copy.countrycode = [self.countrycode copyWithZone:zone];
        copy.lat = self.lat;
        copy.fcode = [self.fcode copyWithZone:zone];
        copy.toponymName = [self.toponymName copyWithZone:zone];
        copy.lng = self.lng;
        copy.name = [self.name copyWithZone:zone];
        copy.fcl = [self.fcl copyWithZone:zone];
    }
    
    return copy;
}


@end
