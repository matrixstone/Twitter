//
//  NewTweet.h
//  Twitter
//
//  Created by Xu He on 2/10/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface NewTweet : UIViewController
@property (nonatomic, strong) User *user;

@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *screenName;
@property (weak, nonatomic) IBOutlet UITextView *tweetContent;

-(NewTweet *)initWithUser:(User *)user;
- (IBAction)onTap:(id)sender;

@end
