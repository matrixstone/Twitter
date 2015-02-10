//
//  LoginViewController.m
//  Twitter
//
//  Created by Xu He on 2/3/15.
//  Copyright (c) 2015 Xu He. All rights reserved.
//

#import "LoginViewController.h"
#import "TwitterClient.h"
#import "TweetsViewController.h"

@interface LoginViewController ()
@property (nonatomic) BDBOAuth1RequestOperationManager *networkManager;

@end

@implementation LoginViewController

- (IBAction)onLogin:(id)sender {
    [[TwitterClient sharedInstance] loginWithCompletion:^(User *user, NSError *error) {
        if (user != nil) {
            //Modally present tweets view
            NSLog(@"Welcome to %@", user.name);
            
            //Set navigationController
            UINavigationController *nvc =[[UINavigationController alloc] initWithRootViewController:[[TweetsViewController alloc] init]];
            nvc.navigationBar.translucent=NO;
            [self presentViewController:nvc animated:YES completion:nil];
            
        }else{
            //print view controel
            NSLog(@"Fail at LoginViewController ");
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
