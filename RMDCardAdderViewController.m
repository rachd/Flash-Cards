//
//  RMDCardAdderViewController.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/27/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDCardAdderViewController.h"
#import "RMDCardAdderView.h"

@interface RMDCardAdderViewController ()

@property (nonatomic, strong) RMDCardAdderView *cardAdderView;

@end

@implementation RMDCardAdderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cardAdderView = [[RMDCardAdderView alloc] initWithFrame:self.view.frame viewController:self];
    self.view = self.cardAdderView;
}

- (void)addCard {
    if (![self.cardAdderView.keyField.text isEqualToString:@""] && ![self.cardAdderView.valueField.text isEqualToString:@""]) {
        [self.delegate setNewCard:self.cardAdderView.keyField.text object:self.cardAdderView.valueField.text];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
