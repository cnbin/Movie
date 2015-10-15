//
//  CNDetailTableViewCell.m
//  Movie
//
//  Created by Apple on 10/15/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "CNDetailTableViewCell.h"
#import <PureLayout/PureLayout.h>
#define kLabelHorizontalInsets      15.0f
#define kLabelVerticalInsets        5.0f

@interface CNDetailTableViewCell ()

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation CNDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.movie_tags = [UILabel newAutoLayoutView];
        [self.movie_tags setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.movie_tags setNumberOfLines:1];
        [self.movie_tags setTextAlignment:NSTextAlignmentLeft];
        [self.movie_tags setTextColor:[UIColor blackColor]];
        
        self.movie_message = [UILabel newAutoLayoutView];
        [self.movie_message setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.movie_message setNumberOfLines:1];
        [self.movie_message setTextAlignment:NSTextAlignmentLeft];
        [self.movie_message setTextColor:[UIColor blackColor]];
        self.movie_message.font = [UIFont fontWithName:@"Helvetica" size:12];
        
        self.movie_description= [UILabel newAutoLayoutView];
        [self.movie_description setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.movie_description setNumberOfLines:0];
        [self.movie_description setTextAlignment:NSTextAlignmentLeft];
        [self.movie_description setTextColor:[UIColor blackColor]];
        self.movie_description.font = [UIFont fontWithName:@"Helvetica" size:12];

        self.time_table = [UILabel newAutoLayoutView];
        [self.time_table setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.time_table setNumberOfLines:1];
        [self.time_table setTextAlignment:NSTextAlignmentLeft];
        [self.time_table setTextColor:[UIColor blackColor]];
        self.time_table.font = [UIFont fontWithName:@"Helvetica" size:12];
    
        //self.bodyLabel.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.1]; // light red
        self.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.1];
        
        [self.contentView addSubview:self.movie_tags];
        [self.contentView addSubview:self.movie_message];
        [self.contentView addSubview:self.movie_description];
        [self.contentView addSubview:self.time_table];
  
        
    }
    
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        self.contentView.bounds = CGRectMake(0.0f, 0.0f, 99999.0f, 99999.0f);
        
        //影片标志
        [NSLayoutConstraint autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [self.movie_tags autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
        [self.movie_tags autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
        [self.movie_tags autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:kLabelHorizontalInsets];
        [self.movie_tags autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets];
        
        
        //影片信息
        [NSLayoutConstraint autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [self.movie_message autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
        [self.movie_message autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10];
        [self.movie_message autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets];
        [self.movie_message autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.movie_tags withOffset:10];

        
        //影片描述
        [NSLayoutConstraint autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [self.movie_description autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
        [self.movie_description autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:15];
        [self.movie_description autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.movie_message withOffset:10];
      
        
        //影片放映时间
        [NSLayoutConstraint autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [self.time_table autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
        [self.time_table autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:100];
        [self.time_table autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets];
        [self.time_table autoPinEdgeToSuperviewEdge: ALEdgeBottom withInset:10];
        [self.time_table autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.movie_description withOffset:10];
        
        self.didSetupConstraints = YES;
        
    }
    
    [super updateConstraints];
}

@end
