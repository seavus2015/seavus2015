//
//  DAONews.h
//  Test123
//
//  Created by Design Academy 5 on 4/29/15.
//  Copyright (c) 2015 Design Academy 5. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAONews : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *descriptionn;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *link;

@property (nonatomic,strong) NSNumber *isRead;
@property (nonatomic,strong) NSDate *pubDate;
@end
