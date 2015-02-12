//
//  ProfileViewController.h
//  Twitter
//
//  Created by Xu He on 2/10/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface ProfileViewController : UIViewController
-(ProfileViewController *)initWithUser:(User *)user;
@end
