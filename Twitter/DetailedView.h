//
//  DetailedView.h
//  Twitter
//
//  Created by Xu He on 2/9/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface DetailedView : UIViewController
@property (nonatomic, strong) Tweet *tweet;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *screenName;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;
@property (weak, nonatomic) IBOutlet UILabel *createdAt;

-(void)initWithTweet:(Tweet *)tweet;
@end
