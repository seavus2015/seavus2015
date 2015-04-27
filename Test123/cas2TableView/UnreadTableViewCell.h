//
//  UnreadTableViewCell.h
//  Test123
//
//  Created by Design Academy 5 on 4/27/15.
//  Copyright (c) 2015 Design Academy 5. All rights reserved.
//

#import <UIKit/UIKit.h>


//identifier unreadNews



@interface UnreadTableViewCell : UITableViewCell
{
    IBOutlet UIImageView *newsImageImageView;
    IBOutlet UIImageView *ribbon;
    IBOutlet UILabel *newsTitleLabel;
}

-(void) updateCellWithTitle:(NSString*) _title newsImageView:(UIImage*) newsImage isRead:(BOOL)isRead;

@end
