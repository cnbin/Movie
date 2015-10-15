//
//  MainViewController.m
//  Movie
//
//  Created by Apple on 10/15/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "MainViewController.h"
#import "CNTableViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)check:(id)sender {
    
    [GlobalResource sharedInstance].city = _city.text;
    [GlobalResource sharedInstance].cinema = _cinema.text;
    [self.navigationController pushViewController:[[CNTableViewController alloc]init] animated:YES];
}
@end
