//
//  TweetCell.m
//  Twitter
//
//  Created by Xu He on 2/8/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@interface TweetCell()

@end

@implementation TweetCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setCellvalues:(Tweet *) tweet{
    self.tweet=tweet;
    
    self.name.text=tweet.user.name;
    self.screenName.textColor=[UIColor grayColor];
    self.screenName.text=[NSString stringWithFormat:@"@%@", tweet.user.screenname];
//    self.createdAt=tweet.createdAt;
    self.tweetText.text=tweet.text;
    
    [self.userImage setImageWithURL:[NSURL URLWithString:self.tweet.user.profileImageUrl]];
    
}

@end
