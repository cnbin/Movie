//
//  CNDetailTableViewCell.h
//  Movie
//
//  Created by Apple on 10/15/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNDetailTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *movie_tags;
@property (strong, nonatomic) UILabel *movie_message;
@property (strong, nonatomic) UILabel *movie_description;
@property (strong, nonatomic) UILabel *time_table;

@end
