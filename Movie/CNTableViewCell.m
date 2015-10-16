//
//  CNTableViewCell.m
//  Movie
//
//  Created by Apple on 10/15/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "CNTableViewCell.h"
#import <PureLayout/PureLayout.h>

#define kLabelHorizontalInsets      15.0f
#define kLabelVerticalInsets        5.0f

@interface CNTableViewCell ()

@property (nonatomic, assign) BOOL didSetupConstraints;

@end

@implementation CNTableViewCell

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
    
        self.movie_name = [UILabel newAutoLayoutView];
        [self.movie_name setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.movie_name setNumberOfLines:1];
        [self.movie_name setTextAlignment:NSTextAlignmentLeft];
        [self.movie_name setTextColor:[UIColor blackColor]];
        
        self.movie_director = [UILabel newAutoLayoutView];
        [self.movie_director setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.movie_director setNumberOfLines:1];
        [self.movie_director setTextAlignment:NSTextAlignmentLeft];
        [self.movie_director setTextColor:[UIColor blackColor]];
        self.movie_director.font = [UIFont fontWithName:@"Helvetica" size:12];
        
        self.movie_starring = [UILabel newAutoLayoutView];
        [self.movie_starring  setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.movie_starring  setNumberOfLines:0];
        [self.movie_starring  setTextAlignment:NSTextAlignmentLeft];
        [self.movie_starring  setTextColor:[UIColor blackColor]];
        self.movie_starring.font = [UIFont fontWithName:@"Helvetica" size:12];
        
        self.movie_type = [UILabel newAutoLayoutView];
        [self.movie_type  setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.movie_type  setNumberOfLines:1];
        [self.movie_type  setTextAlignment:NSTextAlignmentLeft];
        [self.movie_type  setTextColor:[UIColor blackColor]];
        self.movie_type.font = [UIFont fontWithName:@"Helvetica" size:12];
        
        self.movie_nation= [UILabel newAutoLayoutView];
        [self.movie_nation setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.movie_nation setNumberOfLines:1];
        [self.movie_nation setTextAlignment:NSTextAlignmentLeft];
        [self.movie_nation setTextColor:[UIColor blackColor]];
        self.movie_nation.font = [UIFont fontWithName:@"Helvetica" size:12];
        
        self.movie_release_date= [UILabel newAutoLayoutView];
        [self.movie_release_date setLineBreakMode:NSLineBreakByTruncatingTail];
        [self.movie_release_date setNumberOfLines:1];
        [self.movie_release_date setTextAlignment:NSTextAlignmentLeft];
        [self.movie_release_date setTextColor:[UIColor blackColor]];
        self.movie_release_date.font = [UIFont fontWithName:@"Helvetica" size:12];

        self.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.1];
        self.movie_picture = [UIImageView newAutoLayoutView];
        
        [self.contentView addSubview:self.movie_name];
        [self.contentView addSubview:self.movie_director];
        [self.contentView addSubview:self.movie_starring];
        [self.contentView addSubview:self.movie_picture];
        [self.contentView addSubview:self.movie_type];
        [self.contentView addSubview: self.movie_nation];
        [self.contentView addSubview: self.movie_release_date];
    }
    return self;
}

- (void)updateConstraints
{
    if (!self.didSetupConstraints) {
        
        self.contentView.bounds = CGRectMake(0.0f, 0.0f, 99999.0f, 99999.0f);
        
        //影片名
        [NSLayoutConstraint autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [self.movie_name autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
        [self.movie_name autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
        [self.movie_name autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:kLabelHorizontalInsets];
        [self.movie_name autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets];
    
        //影片图片
        [NSLayoutConstraint autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [self.movie_picture autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
        [self.movie_picture autoSetDimension:ALDimensionHeight toSize:100.0];
        [self.movie_picture autoSetDimension:ALDimensionWidth toSize:70.0];
        [self.movie_picture autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:15];
        [self.movie_picture autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20];
        [self.movie_picture autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.movie_name withOffset:10];
        
        //导演
        [NSLayoutConstraint autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [self.movie_director autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
        [self.movie_director autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:40];
        [self.movie_director autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:100];
        [self.movie_director autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets];
        
        //主演
        [NSLayoutConstraint autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [self.movie_starring autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
        [self.movie_starring autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:100];
        [self.movie_starring autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets];
        [self.movie_starring autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.movie_director withOffset:kLabelVerticalInsets];

        //类型
        [NSLayoutConstraint autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [self.movie_type autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
        [self.movie_type autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:100];
        [self.movie_type autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets];
        [self.movie_type autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.movie_starring withOffset:kLabelVerticalInsets];
        
        //国家
        [NSLayoutConstraint autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [self.movie_nation autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
        [self.movie_nation autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:100];
        [self.movie_nation autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets];
        [self.movie_nation autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.movie_type withOffset:kLabelVerticalInsets];

        //首映时间
        [NSLayoutConstraint autoSetPriority:UILayoutPriorityRequired forConstraints:^{
            [self.movie_release_date autoSetContentCompressionResistancePriorityForAxis:ALAxisVertical];
        }];
        [self.movie_release_date autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:100];
        [self.movie_release_date autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:kLabelHorizontalInsets];
        [self.movie_release_date autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.movie_nation withOffset:kLabelVerticalInsets];
    
        self.didSetupConstraints = YES;
        
    }
    
    [super updateConstraints];
}

@end
