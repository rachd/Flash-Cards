//
//  RMDSettingsViewController.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/23/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDSettingsViewController.h"
#import "RMDUser.h"

@interface RMDSettingsViewController ()

@end

@implementation RMDSettingsViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"Settings";
        self.settingsView = [[RMDSettingsView alloc] initWithFrame:self.view.frame];
        self.view = self.settingsView;
    }
    return self;
}

- (void)changeCategory {
    [RMDUser currentUser].currentCategory = nil;
    UINavigationController *cardNavController = (UINavigationController *)self.tabBarController.viewControllers[0];
    [cardNavController popToRootViewControllerAnimated:NO];
    [cardNavController.viewControllers[0] viewWillAppear:YES];
    [self.tabBarController setSelectedIndex:0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
