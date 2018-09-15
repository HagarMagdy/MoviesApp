//
//  MoviesPosters.m
//  FinalProject
//
//  Created by Admin on 5/9/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "MoviesPosters.h"
#import "MovieDetails.h"
@interface MoviesPosters ()

@end

@implementation MoviesPosters

static NSString * const reuseIdentifier = @"cell";
bool flag = NO;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _posters=[NSMutableArray array];
    _response = [NSMutableData data];
  
    _titles= [NSMutableArray array];
    _overViews= [NSMutableArray array];
    _releaseDates= [NSMutableArray array];
    _rates= [NSMutableArray array];
    _moviesArray=[NSMutableArray new];
    _ids = [NSMutableArray new];

    
    NSString *urlString;
    NSURL *url ;
    
    urlString = @"http://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=369320df96736495e66e772f1298f23a";
    
    url = [NSURL URLWithString:urlString];
    
    NSURLRequest *req =[NSURLRequest requestWithURL:url];
    
    NSURLConnection *conn=[[NSURLConnection alloc] initWithRequest:req delegate:self];
    [conn start];
    
   
  
   
    
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.response appendData:data];

}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [self.response setLength:0];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:self.response options:NSJSONReadingMutableLeaves error:&myError];
    
    NSMutableArray *val = [res objectForKey:@"results"];
    id returnedImages;

    for (int n=0 ;n<[val count];n++){
        id value = [val objectAtIndex:n];
        myMovie=[Movie new];

         returnedImages = [value objectForKey:@"poster_path"];
        [_posters addObject:returnedImages];
        myMovie.img = [value objectForKey:@"poster_path"];
        
        id returnedTitles = [value objectForKey:@"title"];
        [_titles addObject:returnedTitles];
        myMovie.ttle = [value objectForKey:@"title"];
        
        id returnedOverViews =[value objectForKey:@"overview"];
        [_overViews addObject:returnedOverViews];
        myMovie.overView =[value objectForKey:@"overview"];
        
        id returnedRates =[value objectForKey:@"vote_average"];
        [_rates addObject:returnedRates];
        myMovie.rate=[[value objectForKey:@"vote_average"] stringValue];
        NSLog(@"rate is : %@",returnedRates);
        
      
        myMovie.date=[value objectForKey:@"release_date"];
        
        
        id returnedId = [value objectForKey:@"id"];
        myMovie.movieId=[value objectForKey:@"id"];
        [_moviesArray addObject:myMovie];
        [_ids addObject:returnedId];
        
     
       
        
        

    }
    

   

    [self.myCollection reloadData];

    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if ([_posters count]>0) {
        return [_posters count];
    }
    else
    {return 0;}
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    
    UIImageView *imageView =(UIImageView*)[cell viewWithTag:1];
    
    NSString *baseUrl=@"http://image.tmdb.org/t/p/w185/";
    
    NSString *posterUrl= [baseUrl stringByAppendingString:[_posters objectAtIndex:indexPath.row]];
    
   [imageView sd_setImageWithURL:[NSURL URLWithString:posterUrl]];
    
    
    return cell;
}


-(void)viewDidAppear:(BOOL)animated{
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    
    MovieDetails *details = [self.storyboard instantiateViewControllerWithIdentifier:@"details"];
    myMovie =[_moviesArray objectAtIndex:indexPath.row];
    [details setMovie:myMovie];
    NSLog(@" movie title %@",myMovie.ttle);
    [self.navigationController pushViewController:details animated:YES];
    
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
