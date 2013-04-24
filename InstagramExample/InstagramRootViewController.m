//
//  InstagramRootViewController.m
//  InstagramExample
//
//  Created by Marco S. Graciano on 4/24/13.
//  Copyright (c) 2013 Marco Graciano. All rights reserved.
//

#import "InstagramRootViewController.h"
#import "InstagramDemoViewController.h"

@interface InstagramRootViewController ()

@end

@interface InstagramRootViewController ()

@end

@implementation InstagramRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(performLogin) forControlEvents:UIControlEventTouchUpInside];
    [loginButton setFrame:CGRectMake(self.view.bounds.size.width/2 - 50, self.view.bounds.size.height/2 - 20, 100, 40)];
    
    [self.view addSubview:loginButton];
    
    [self performSelector:@selector(LoginWithNoAnimation) withObject:nil afterDelay:0.1f];
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)performLogin{
    
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"accessToken"]) {
        InstagramDemoViewController *demoVC = [[InstagramDemoViewController alloc] init];
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:demoVC];
        
        [self presentModalViewController:navController animated:YES];
    } else
    {
        [[RMMasterSDK InstagramSDK] authorizeWithScopes:[NSArray arrayWithObjects:@"comments", nil]];
        [[RMMasterSDK InstagramSDK] setLoginDelegate:self];
    }
}

-(void)performLoginFromHandle{
    [self performLogin];
}

-(void)LoginWithNoAnimation{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"accessToken"]) {
        InstagramDemoViewController *demoVC = [[InstagramDemoViewController alloc] init];
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:demoVC];
        
        [self presentModalViewController:navController animated:NO];
    }
}

@end
