//
//  MoviesPosters.h
//  FinalProject
//
//  Created by Admin on 5/9/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "Movie.h"


@interface MoviesPosters : UICollectionViewController<NSURLConnectionDataDelegate , NSURLConnectionDelegate>
{
    
    Movie *myMovie;
}
@property (strong, nonatomic) IBOutlet UICollectionView *myCollection;

@property NSMutableData *response;

@property NSMutableArray *titles;
@property NSMutableArray *posters;
@property NSMutableArray *overViews;
@property NSMutableArray *releaseDates;
@property NSMutableArray *rates;
@property NSMutableArray *ids;

@property NSMutableArray *moviesArray;





@end
