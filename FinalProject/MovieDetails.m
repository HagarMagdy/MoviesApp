//
//  MovieDetails.m
//  FinalProject
//
//  Created by Admin on 5/10/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "MovieDetails.h"
#import "TrailersTableViewController.h"

@interface MovieDetails ()

@end

@implementation MovieDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_titlee setText:[_movie ttle]];
    [_date setText:[_movie date]];
   [_rete setText:[_movie rate]];
    [_overView setText:[_movie overView]];
    

    
    NSString *baseUrl=@"http://image.tmdb.org/t/p/w185/";
    
    NSString *posterUrl= [baseUrl stringByAppendingString:[_movie img]];
     [_img sd_setImageWithURL:[NSURL URLWithString:posterUrl]];
    // _img.image = [UIImage imageNamed:posterUrl];
    NSLog(@"URL %@",posterUrl);
    
    
   
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)getTrailers:(id)sender {
    
    TrailersTableViewController *trailers = [self.storyboard instantiateViewControllerWithIdentifier:@"trailer"];
    [trailers setMyMovie:_movie];
    [self.navigationController pushViewController:trailers animated:YES];

}


@end
