//
//  NewTweet.m
//  Twitter
//
//  Created by Xu He on 2/10/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "NewTweet.h"
#import "UIImageView+AFNetWorking.h"
#import "TwitterClient.h"

@interface NewTweet ()

@end

@implementation NewTweet

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    self.navigationController.navigationBar.tintColor=[UIColor colorWithRed:0.23 green:0.79 blue:0.93 alpha:1.0];
    
    if (self.user !=nil) {
        [self.profileImage setImageWithURL:[NSURL URLWithString:self.user.profileImageUrl]];
        self.name.text=self.user.name;
        self.screenName.text=[NSString stringWithFormat:@"@%@", self.user.screenname];
    }
    
    //Set method for tweet
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Tweet" style:UIBarButtonItemStylePlain target:self action:@selector(onTweet)];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onTweet{
    [[TwitterClient sharedInstance] postTweet:self.tweetContent.text withUser:self.user];
}

-(NewTweet *)initWithUser:(User *)user{
    NewTweet *nt=[[NewTweet alloc]init];
    nt.user=user;
    
    return nt;
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
