//
//  User.m
//  Twitter
//
//  Created by Xu He on 2/4/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "User.h"

@implementation User


-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        self.name=dictionary[@"name"];
        self.screenname=dictionary[@"screenname"];
        self.profileImageUrl=dictionary[@"profile_image_url"];
        self.tagline=dictionary[@"description"];
    }
    
    return self;
}

@end
