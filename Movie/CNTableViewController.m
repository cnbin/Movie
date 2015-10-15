//
//  CNTableViewController.m
//  Movie
//
//  Created by Apple on 10/15/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import "CNTableViewController.h"
#import "CNTableViewCell.h"
#import "MBProgressHUD.h"
#import "UIImageView+WebCache.h"
#import "CNDetailTableViewController.h"

static NSString *CellIdentifier = @"CellIdentifier";

@interface CNTableViewController ()

@end

@implementation CNTableViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"影讯查询";
    self.tableView.allowsSelection = NO;
    [self.tableView registerClass:[CNTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0;
    NSString *location = [[GlobalResource sharedInstance].city stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString * wd = [[GlobalResource sharedInstance].cinema stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *httpUrl = @"http://apis.baidu.com/apistore/movie/cinema";
    NSString *httpArg = [NSString stringWithFormat:@"wd=%@&location=%@&rn=15&output=json&coord_type=bd09ll&out_coord_type=bd09ll",wd,location];
    [self request: httpUrl withHttpArg: httpArg];
    self.tableView.delegate = self;
    self.tableView.dataSource=self;
}

- (void)request:(NSString*)httpUrl withHttpArg:(NSString*)HttpArg  {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSString *urlStr = [[NSString alloc]initWithFormat: @"%@?%@", httpUrl, HttpArg];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url cachePolicy: NSURLRequestUseProtocolCachePolicy timeoutInterval: 10];
    [request setHTTPMethod: @"GET"];
    [request addValue: @"c33bdd6ad06c082a12a171edc323cc9a" forHTTPHeaderField: @"apikey"];
    NSURLConnection *connection = [[NSURLConnection alloc]
                                   initWithRequest:request delegate:self];
    
    if (connection) {
        
    }
}

#pragma mark 接受到响应
- (void)connection: (NSURLConnection *)connection didReceiveResponse: (NSURLResponse *)response {
    
    if (!self.receiveData) {
        self.receiveData = [NSMutableData data];
    }
}

- (void)connection: (NSURLConnection *)connection didReceiveData: (NSData *)data {
    
    [self.receiveData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError: (NSError *)error {
    
    
}

- (void)connectionDidFinishLoading: (NSURLConnection*) connection {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:self.receiveData  options:NSJSONReadingMutableLeaves error:nil];
    NSArray * dicArray = [dic objectForKey:@"result"];
    NSDictionary *resultDic = [dicArray objectAtIndex:0];
    _movieArray = [resultDic objectForKey:@"movies"];
    [GlobalResource sharedInstance].movie_array = _movieArray;
    [self.tableView reloadData];

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
    
    return [_movieArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CNTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.movie_name.text = [[_movieArray objectAtIndex:indexPath.row]objectForKey:@"movie_name"];
    
    cell.movie_director.text = [[[NSString alloc]initWithFormat:@"导演:%@",[[_movieArray objectAtIndex:indexPath.row]objectForKey:@"movie_director"]]stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    cell.movie_starring.text = [[[NSString alloc]initWithFormat:@"主演:%@",[[_movieArray objectAtIndex:indexPath.row]objectForKey:@"movie_starring"]] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    cell.movie_type.text = [[[NSString alloc]initWithFormat:@"类型:%@",[[_movieArray objectAtIndex:indexPath.row]objectForKey:@"movie_type"]] substringToIndex:5];
   
    cell.movie_nation.text = [[NSString alloc]initWithFormat:@"国家:%@",[[_movieArray objectAtIndex:indexPath.row]objectForKey:@"movie_nation"]];

    cell.movie_release_date.text = [[NSString alloc]initWithFormat:@"首映时间:%@",[[_movieArray objectAtIndex:indexPath.row]objectForKey:@"movie_release_date"]];
    
    [cell.movie_picture sd_setImageWithURL:[NSURL URLWithString:[[_movieArray objectAtIndex:indexPath.row]objectForKey:@"movie_picture"]]
                          placeholderImage:nil];

    [cell setNeedsUpdateConstraints];
    [cell updateConstraintsIfNeeded];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cell setUserInteractionEnabled:YES];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"aa");
    CNDetailTableViewController * cnDetail = [[CNDetailTableViewController alloc]init];
    [self.navigationController pushViewController:cnDetail animated:YES];
    [GlobalResource sharedInstance].movie_number = [NSString stringWithFormat: @"%ld", (long)indexPath.row];
    
}

@end
