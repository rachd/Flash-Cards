//
//  RMDCategoryAdderViewController.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/28/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDCategoryAdderViewController.h"
#import "RMDCategoryAdderView.h"

@interface RMDCategoryAdderViewController ()

@property (nonatomic, strong) RMDCategoryAdderView *cardSetAdderView;

@end

@implementation RMDCategoryAdderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cardSetAdderView = [[RMDCategoryAdderView alloc] initWithFrame:self.view.frame viewController:self];
    self.view = self.cardSetAdderView;
}

- (void)addCardSet {
    if (![self.cardSetAdderView.nameField.text isEqualToString:@""]) {
        [self.delegate setNewCategory:self.cardSetAdderView.nameField.text];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
