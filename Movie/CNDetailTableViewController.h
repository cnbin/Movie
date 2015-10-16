//
//  CNDetailTableViewController.h
//  Movie
//
//  Created by Apple on 10/15/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CNDetailTableViewController : UITableViewController

@property (nonatomic ,strong) NSString * movie_number;

@property (nonatomic ,strong) NSMutableArray * movie_array;

@property (nonatomic ,strong) NSMutableArray * time_date_Array;

//时间字符串
@property (nonatomic ,strong) NSString * time_table_time_string;

//日期字符串
@property (nonatomic ,strong) NSString * time_table_date_string;

//时间+日期字符串
@property (nonatomic ,strong) NSString * time_and_date_string;


@property (nonatomic ,strong) NSMutableArray * time_table_Array;

@property (nonatomic ,strong) NSString * finalString;
@property (nonatomic ,strong) NSString * finalDateString;

@end

