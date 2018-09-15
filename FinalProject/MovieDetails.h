//
//  MovieDetails.h
//  FinalProject
//
//  Created by Admin on 5/10/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MovieDetails : UIViewController<NSURLConnectionDataDelegate , NSURLConnectionDelegate>
- (IBAction)getTrailers:(id)sender;
@property Movie *movie;
@property (weak, nonatomic) IBOutlet UILabel *titlee;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *time;

@property (weak, nonatomic) IBOutlet UILabel *rete;
@property (weak, nonatomic) IBOutlet UITextView *overView;

@end
