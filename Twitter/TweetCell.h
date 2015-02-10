//
//  TweetCell.h
//  Twitter
//
//  Created by Xu He on 2/8/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetCell : UITableViewCell
@property (nonatomic, strong) Tweet *tweet;

-(void) setCellvalues:(Tweet *) tweet;

@property (weak, nonatomic) IBOutlet UIImageView *userImage;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *screenName;
@property (weak, nonatomic) IBOutlet UILabel *tweetText;

@end
