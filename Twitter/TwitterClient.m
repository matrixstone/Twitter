//
//  TwitterClient.m
//  Twitter
//
//  Created by Xu He on 2/3/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "TwitterClient.h"
#import "Tweet.h"

NSString * const kTwitterConsumerKey=@"hJYMmIYKySqwwc5yybWkL2UMq";
NSString * const kTwitterConsumerSecret=@"04rJiMgjfu7hFK5aeAycpH6usIUSILQdahmsb0S3s164llTa5V";
NSString * const kTwitterBaseUrl=@"https://api.twitter.com/";

@interface TwitterClient()

@property (nonatomic, strong) void (^loginWithCompletion)(User *user, NSError *error);

@end

@implementation TwitterClient

+(TwitterClient *)sharedInstance{
    static TwitterClient *instance =nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(instance == nil) {
            instance=[[TwitterClient alloc] initWithBaseURL:[NSURL URLWithString:kTwitterBaseUrl] consumerKey:kTwitterConsumerKey consumerSecret:kTwitterConsumerSecret];
        }
    });
    
    return instance;
}

-(void) loginWithCompletion:(void (^)(User *user, NSError *error))completion{
    self.loginWithCompletion = completion;
    
    [self.requestSerializer removeAccessToken];
//    NSLog(@"Test 1");
    [self fetchRequestTokenWithPath:@"/oauth/request_token"
                                                       method:@"GET"
                                                  callbackURL:[NSURL URLWithString:@"cptwitterdemo://oauth"]
                                                        scope:nil
                                                      success:^(BDBOAuth1Credential *requestToken) {
                                                          NSURL *authURL=[NSURL URLWithString:[NSString stringWithFormat:@"https://api.twitter.com/oauth/authorize?oauth_token=%@", requestToken.token]];
                                                          [[UIApplication sharedApplication] openURL:authURL];
                                                          
                                                      }
                                                      failure:^(NSError *error) {
                                                          NSLog(@"%@", error);
                                                          NSLog(@"Failed to get the request token!");
                                                      }];

}

-(void) openURL:(NSURL *)url{
    [self fetchAccessTokenWithPath:@"oauth/access_token" method:@"POST" requestToken:[BDBOAuth1Credential credentialWithQueryString:url.query] success:^(BDBOAuth1Credential *accessToken) {
        NSLog(@"got the access token");
        [self.requestSerializer saveAccessToken:accessToken];
        
        [self GET:@"/1.1/account/verify_credentials.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //            NSLog(@"current user: %@", responseObject);
            User *user=[[User alloc]initWithDictionary:responseObject];
            [User setCurrentUser:user];
//            NSLog(@" User Name: %@", user.name);
            self.loginWithCompletion(user, nil);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error with sharedInstance GET");
        }];
        
    } failure:^(NSError *error) {
        NSLog(@"fail to get the access token");
        self.loginWithCompletion(nil,error);
    }];

}

-(void)homeTimelineWithParams:(NSDictionary *)params completion:(void (^)(NSArray *tweets, NSError *error))completion{
    [self GET:@"/1.1/statuses/home_timeline.json" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@", responseObject);
        NSArray *tweets = [Tweet tweetsWithArray:responseObject];
        completion(tweets, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completion(nil, error);
    }];
}

@end
