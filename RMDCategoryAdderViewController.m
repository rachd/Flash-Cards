//
//  RMDCategoryAdderViewController.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/28/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDCategoryAdderViewController.h"
#import "RMDCategoryAdderView.h"
#import "RMDUser.h"

@interface RMDCategoryAdderViewController ()

@property (nonatomic, strong) RMDCategoryAdderView *cardSetAdderView;

@end

@implementation RMDCategoryAdderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cardSetAdderView = [[RMDCategoryAdderView alloc] initWithFrame:self.view.frame viewController:self];
    if (self.category) {
        self.cardSetAdderView.nameField.text = self.category.name;
    }
    self.view = self.cardSetAdderView;
}

- (void)addCardSet {
    if (![self.cardSetAdderView.nameField.text isEqualToString:@""]) {
        if (self.category) {
            self.category.name = self.cardSetAdderView.nameField.text;
        } else {
            [self.delegate setNewCategory:self.cardSetAdderView.nameField.text];
        }
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
