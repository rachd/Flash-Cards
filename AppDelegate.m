//
//  AppDelegate.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/23/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "AppDelegate.h"
#import "RMDSettingsViewController.h"
#import "RMDTranslateViewController.h"
#import "RMDCardsTableViewController.h"
#import "RMDQuizViewController.h"
#import "RMDConstants.h"
#import "RMDSignInViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UITabBarController *tabs;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [FIRApp configure];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    RMDSettingsViewController *settingsVC = [[RMDSettingsViewController alloc] init];
    RMDTranslateViewController *translateVC = [[RMDTranslateViewController alloc] init];
    RMDQuizViewController *quizVC = [[RMDQuizViewController alloc] init];
    RMDCardsTableViewController *cardsVC = [[RMDCardsTableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *cardNavController = [[UINavigationController alloc] initWithRootViewController:cardsVC];
    cardNavController.navigationBar.tintColor = [RMDConstants contrastColor];
    cardNavController.tabBarItem.title = @"Cards";

    
    self.tabs = [[UITabBarController alloc] init];
    self.tabs.viewControllers = @[cardNavController, quizVC, translateVC, settingsVC];
    
    [self.window setRootViewController:self.tabs];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
//    RMDSignInViewController *signInVC = [[RMDSignInViewController alloc] init];
//    [self.tabs presentViewController:signInVC animated:YES completion:nil];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
