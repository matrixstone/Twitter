//
//  TweetsViewController.m
//  Twitter
//
//  Created by Xu He on 2/7/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "TweetsViewController.h"
#import "User.h"
#import "TwitterClient.h"
#import "Tweet.h"
#import "TweetCell.h"
#import "DetailedView.h"
#import "NewTweet.h"

@interface TweetsViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *tweets;
@end

@implementation TweetsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Setting for navigation bar:
    self.title=@"Tweets";
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.23 green:0.79 blue:0.93 alpha:1.0];
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    
    //navigation bar left item and right item
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(onLogout)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"New" style:UIBarButtonItemStylePlain target:self action:@selector(onNew)];
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self.tableView registerNib:[UINib nibWithNibName:@"TweetCell" bundle:nil] forCellReuseIdentifier:@"TweetCell"];

    // Do any additional setup after loading the view from its nib.
    [[TwitterClient sharedInstance] homeTimelineWithParams:nil completion:^(NSArray *tweets, NSError *error) {
        self.tweets=tweets;
        [self.tableView reloadData];
//        for (Tweet *tweet in tweets) {
////            NSLog(@"tweet: %@", tweet.text);
////            NSLog(@"%@", tweet);
//        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onLogout{
    [User logout];
}

- (void)onNew{
    NewTweet *vc = [[NewTweet alloc] initWithUser:[User currentUser]];
    [self.navigationController pushViewController:vc animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tweets.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TweetCell *cell=[tableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    [cell setCellvalues:self.tweets[indexPath.row]];
//
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailedView *vc = [[DetailedView alloc] init];
    vc.tweet=self.tweets[indexPath.row];
    NSLog(@"Test from didSelectRowAtIndexPath");
    [self.navigationController pushViewController:vc animated:YES];
}

//- (IBAction)onLogout:(id)sender {
//    [User logout];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
