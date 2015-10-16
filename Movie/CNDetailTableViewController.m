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
    self.title= @"影片内容";
    self.tableView.allowsSelection = YES;
    [self.tableView registerClass:[CNDetailTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0;
    
    _movie_array = [GlobalResource sharedInstance].movie_array ;
    _movie_number = [GlobalResource sharedInstance].movie_number;
    
    _time_table_Array = [[_movie_array objectAtIndex:[_movie_number intValue]]objectForKey:@"time_table"];
    _time_date_Array = [[NSMutableArray alloc]init];
    
    for (int i =0 ; i< _time_table_Array.count; i++) {
        
        _time_table_date_string = [[_time_table_Array objectAtIndex:i]objectForKey:@"date"];
        _time_table_time_string = [[_time_table_Array objectAtIndex:i]objectForKey:@"time"];
        
        _time_and_date_string = [[_time_table_date_string stringByAppendingString:@" "]stringByAppendingString:_time_table_time_string];
        
        [_time_date_Array addObject:_time_and_date_string];
        
    }
    [GlobalResource sharedInstance].time_table_array = _time_date_Array;
   
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
  
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(contentSizeCategoryChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIContentSizeCategoryDidChangeNotification
                                                  object:nil];
}

- (void)contentSizeCategoryChanged:(NSNotification *)notification {
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CNDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    cell.movie_tags.text =[[NSString alloc]initWithFormat:@"影片标志:%@",[[_movie_array objectAtIndex:[_movie_number intValue]]objectForKey:@"movie_tags"]];

    cell.movie_message.text =[[NSString alloc]initWithFormat:@"影片信息:%@",[[_movie_array objectAtIndex:[_movie_number intValue]]objectForKey:@"movie_message"]];

    cell.movie_description.text =[[NSString alloc]initWithFormat:@"影片描述:%@",[[_movie_array objectAtIndex:[_movie_number intValue]]objectForKey:@"movie_description"]];

    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    
    return cell;
     
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"timeSegue" sender:nil];
   
    
}

@end
