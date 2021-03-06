//
//  TwitterClient.h
//  Twitter
//
//  Created by Xu He on 2/3/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "BDBOAuth1RequestOperationManager.h"
#import "User.h"

@interface TwitterClient : BDBOAuth1RequestOperationManager

+(TwitterClient *)sharedInstance;

-(void) loginWithCompletion:(void (^)(User *user, NSError *error))completion;
-(void) openURL:(NSURL *)url;

-(void)homeTimelineWithParams:(NSDictionary *)params completion:(void (^)(NSArray *tweets, NSError *error))completion;

-(void)postTweet:(NSString *)content withUser:(User *)user;
@end
