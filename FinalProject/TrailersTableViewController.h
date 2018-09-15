//
//  TrailersTableViewController.h
//  FinalProject
//
//  Created by Admin on 5/16/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface TrailersTableViewController : UITableViewController<NSURLConnectionDataDelegate , NSURLConnectionDelegate>
@property Movie* myMovie;
@property NSMutableData *trailerResponse;
@property NSMutableArray *keys;
@property NSMutableArray *names;

@end
