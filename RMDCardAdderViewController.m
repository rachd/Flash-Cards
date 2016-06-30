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
    if (self.card) {
        self.cardAdderView.wordField.text = self.card.word;
        self.cardAdderView.definitionField.text = self.card.definition;
    }
    self.view = self.cardAdderView;
}

- (void)addCard {
    if (![self.cardAdderView.wordField.text isEqualToString:@""] && ![self.cardAdderView.definitionField.text isEqualToString:@""]) {
        if (self.card) {
            self.card.word = self.cardAdderView.wordField.text;
            self.card.definition = self.cardAdderView.definitionField.text;
        } else {
            [self.delegate setNewCard:self.cardAdderView.wordField.text definition:self.cardAdderView.definitionField.text];
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
