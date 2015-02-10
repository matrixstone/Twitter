//
//  Tweet.m
//  Twitter
//
//  Created by Xu He on 2/4/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self=[super init];
    if (self) {
        self.user = [[User alloc]initWithDictionary:dictionary[@"user"]];
        self.text=dictionary[@"text"];
//        NSLog(@"user name: %@", dictionary[@"favorite_count"]);
        NSString *createdAtString=dictionary[@"created_at"];
        NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
        formatter.dateFormat=@"EEE MMM d HH:mm:ss Z y";
        self.createdAt=[formatter dateFromString:createdAtString];
        
    }
    return self;
}

+(NSArray *) tweetsWithArray:(NSArray *)array{
    NSMutableArray *tweets=[NSMutableArray array];
    
    for (NSDictionary *dictionary in array) {
        [tweets addObject:[[Tweet alloc]initWithDictionary:dictionary]];
    }
    return tweets;
}

@end
