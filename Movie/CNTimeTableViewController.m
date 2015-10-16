//
//  CNTimeTableViewController.m
//  Movie
//
//  Created by Apple on 10/16/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "CNTimeTableViewController.h"

@interface CNTimeTableViewController ()

@end

@implementation CNTimeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"放映时间";
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return  [[GlobalResource sharedInstance].time_table_array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell;
    NSInteger row = indexPath.row;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];

    cell.textLabel.text = [[GlobalResource sharedInstance].time_table_array objectAtIndex:row];

    cell.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.1];
    return cell;
}

@end
