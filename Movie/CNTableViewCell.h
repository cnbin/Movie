//
//  CNTableViewCell.h
//  Movie
//
//  Created by Apple on 10/15/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *movie_name;
@property (strong, nonatomic) UIImageView *movie_picture;
@property (strong, nonatomic) UILabel *movie_director;
@property (strong, nonatomic) UILabel *movie_starring;
@property (strong, nonatomic) UILabel *movie_type;
@property (strong, nonatomic) UILabel *movie_nation;
@property (strong, nonatomic) UILabel *movie_release_date;

@end
