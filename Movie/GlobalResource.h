//
//  GlobalResource.h
//  Movie
//
//  Created by Apple on 10/15/15.
//  Copyright © 2015 cnbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalResource : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) NSString * cinema;
@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) NSMutableArray * movie_array;
@property (nonatomic, strong) NSMutableArray * time_table_array;
@property (nonatomic, strong) NSString * movie_number;

@end
