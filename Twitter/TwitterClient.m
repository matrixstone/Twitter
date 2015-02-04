//
//  TwitterClient.m
//  Twitter
//
//  Created by Xu He on 2/3/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "TwitterClient.h"

NSString * const kTwitterConsumerKey=@"hJYMmIYKySqwwc5yybWkL2UMq";
NSString * const kTwitterConsumerSecret=@"04rJiMgjfu7hFK5aeAycpH6usIUSILQdahmsb0S3s164llTa5V";
NSString * const kTwitterBaseUrl=@"http://api.twitter.com";

@implementation TwitterClient

+(TwitterClient *)sharedInstance{
    static TwitterClient *instance =nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(instance == nil) {
            instance=[[TwitterClient alloc]initWithBaseURL:[NSURL URLWithString:kTwitterBaseUrl] consumerKey:kTwitterConsumerKey consumerSecret:kTwitterConsumerSecret];
        }
    });
    
    return instance;
}

@end
