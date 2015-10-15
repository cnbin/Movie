//
//  CNDetailTableViewController.m
//  Movie
//
//  Created by Apple on 10/15/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "CNDetailTableViewController.h"
#import <PureLayout/PureLayout.h>
#import "CNDetailTableViewCell.h"

#define kLabelHorizontalInsets      15.0f
#define kLabelVerticalInsets        5.0f

static NSString *CellIdentifier = @"DetailCellIdentifier";

@interface CNDetailTableViewController ()

@end

@implementation CNDetailTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
  
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[GlobalResource sharedInstance].movie_array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CNDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    _movie_array = [GlobalResource sharedInstance].movie_array ;
    _movie_number = [GlobalResource sharedInstance].movie_number;

    cell.movie_tags.text =[[NSString alloc]initWithFormat:@"影片标志:%@",[[_movie_array objectAtIndex:[_movie_number intValue]]objectForKey:@"movie_name"]];

    cell.movie_message.text =[[NSString alloc]initWithFormat:@"影片信息:%@",[[_movie_array objectAtIndex:[_movie_number intValue]]objectForKey:@"movie_message"]];

    cell.movie_description.text =[[NSString alloc]initWithFormat:@"影片描述:%@",[[_movie_array objectAtIndex:[_movie_number intValue]]objectForKey:@"movie_description"]];

    cell.time_table.text =[[NSString alloc]initWithFormat:@"影片放映时间:%@",[[_movie_array objectAtIndex:[_movie_number intValue]]objectForKey:@"time_table."]];
    return cell;
}

@end
