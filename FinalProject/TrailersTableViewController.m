//
//  TrailersTableViewController.m
//  FinalProject
//
//  Created by Admin on 5/16/18.
//  Copyright © 2018 Admin. All rights reserved.
//

#import "TrailersTableViewController.h"

@interface TrailersTableViewController ()

@end

@implementation TrailersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _keys = [NSMutableArray new];
    _names = [NSMutableArray new];
    _trailerResponse = [NSMutableData data];
    NSString *trailerUrl=@"http://api.themoviedb.org/3/movie/";
    
    NSString *t = [trailerUrl stringByAppendingFormat:@"%@", [_myMovie movieId]];
    NSString *trailer = [t stringByAppendingString:@"?api_key=369320df96736495e66e772f1298f23a&append_to_response=videos"];
    NSURL  *url2 = [NSURL URLWithString:trailer];
    
    NSURLRequest *req2 =[NSURLRequest requestWithURL:url2];
    
    NSURLConnection *conn2=[[NSURLConnection alloc] initWithRequest:req2 delegate:self];
    [conn2 start];

}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.trailerResponse appendData:data];
    
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [self.trailerResponse setLength:0];
    
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    
    NSError *myError = nil;
    NSDictionary *res2 = [NSJSONSerialization JSONObjectWithData:self.trailerResponse options:NSJSONReadingMutableLeaves error:&myError];
    
    id val2 = [res2 objectForKey:@"videos"];
    id v2 = [val2 objectForKey:@"results"];
    NSMutableArray *v22 = [val2 objectForKey:@"results"];
    
    for (int i=0; i<[v22 count]; i++) {
        id aya = [v2 objectAtIndex:i];
        id key = [aya objectForKey:@"key"];
        id name = [aya objectForKey:@"name"];
        NSLog(@"KEY = %@",key);
        [_keys addObject:key];
        [_names addObject:name];
    }
    
    [self.tableView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    if ([_keys count]>0) {
        return [_keys count];
    }
    else
        return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [_names objectAtIndex:indexPath.row];
    // Configure the cell...
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *videoName = _keys[indexPath.row];
    NSString *string = [NSString stringWithFormat:@"http://www.youtube.com/watch?v=%@", videoName];
    NSURL *url = [NSURL URLWithString:string];
    UIApplication *app = [UIApplication sharedApplication];
    [app openURL:url];
    
    
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
