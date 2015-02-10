//
//  DetailedView.m
//  Twitter
//
//  Created by Xu He on 2/9/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "DetailedView.h"
#import "UIImageView+AFNetworking.h"

@interface DetailedView ()

@end

@implementation DetailedView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Tweet";
    
    [self.backgroundImage setImageWithURL:[NSURL URLWithString:self.tweet.user.backgroundUrl]];
    [self.profileImage setImageWithURL:[NSURL URLWithString:self.tweet.user.profileImageUrl]];
    self.name.text=self.tweet.user.name;
    self.screenName.text=[NSString stringWithFormat:@"@%@", self.tweet.user.screenname];
    self.tweetText.text=self.tweet.text;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"EEE MMM d HH:mm:ss"];
    self.createdAt.text = [formatter stringFromDate:self.tweet.createdAt];
    
//    NSLog(@"Detailed View");
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initWithTweet:(Tweet *)tweet{
    self.tweet=tweet;
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
