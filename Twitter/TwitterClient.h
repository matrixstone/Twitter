//
//  TwitterClient.h
//  Twitter
//
//  Created by Xu He on 2/3/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "BDBOAuth1RequestOperationManager.h"

@interface TwitterClient : BDBOAuth1RequestOperationManager

+(TwitterClient *)sharedInstance;

@end
