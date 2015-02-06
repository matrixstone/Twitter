//
//  Tweet.h
//  Twitter
//
//  Created by Xu He on 2/4/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface Tweet : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) User *user;

-(id) initWithDictionary:(NSDictionary *)dictionary;


@end
