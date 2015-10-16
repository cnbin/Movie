//
//  MainViewController.m
//  Movie
//
//  Created by Apple on 10/15/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "MainViewController.h"
#import "CNTableViewController.h"
#import "QBFlatButton.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title= @"影讯查询";
    QBFlatButton *button1 = [QBFlatButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(130, 220, 100, 30);
    button1.faceColor = [UIColor colorWithRed:86.0/255.0 green:161.0/255.0 blue:217.0/255.0 alpha:1.0];
    button1.sideColor = [UIColor colorWithRed:79.0/255.0 green:127.0/255.0 blue:179.0/255.0 alpha:1.0];
    button1.radius = 8.0;
    button1.margin = 4.0;
    button1.depth = 3.0;
    
    button1.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 setTitle:@"查询" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonAction:(UIButton *)button{
    
    [GlobalResource sharedInstance].city = _city.text;
    [GlobalResource sharedInstance].cinema = _cinema.text;
    CNTableViewController * cn = [[self storyboard] instantiateViewControllerWithIdentifier:@"CNTableViewControllerStoryboard"];
    [self.navigationController pushViewController:cn animated:YES];
}
@end
