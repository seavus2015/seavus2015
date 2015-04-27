//
//  UnreadTableViewCell.m
//  Test123
//
//  Created by Design Academy 5 on 4/27/15.
//  Copyright (c) 2015 Design Academy 5. All rights reserved.
//

#import "UnreadTableViewCell.h"

@implementation UnreadTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void) updateCellWithTitle:(NSString*) _title newsImageView:(UIImage*) newsImage isRead:(BOOL)isRead
{
    
    [newsTitleLabel setText:_title];
    [newsImageImageView setImage:newsImage];
    if(isRead)
    {
        [ribbon setHidden:YES];
    }
}
@end
