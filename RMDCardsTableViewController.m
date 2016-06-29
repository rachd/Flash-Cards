//
//  RMDCardsTableViewController.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/24/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDCardsTableViewController.h"
#import "RMDUser.h"
#import "RMDCardTableViewCell.h"
#import "RMDCategoriesTableViewController.h"
#import "RMDCardAdderViewController.h"
#import "RMDCategoryAdderViewController.h"
#import "RMDConstants.h"

@interface RMDCardsTableViewController () <RMDCardAdderDelegate, RMDCardSetAdderDelegate>

@property (nonatomic, strong) NSArray *cards;
@property (nonatomic, strong) RMDCategory *currentCategory;
@property (nonatomic, strong) RMDCategoriesTableViewController *categoriesVC;

@end

@implementation RMDCardsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [RMDConstants backgroundColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.allowsSelectionDuringEditing = YES;
    UIBarButtonItem *addCardButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCard)];
    self.navigationItem.rightBarButtonItem = addCardButton;
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([[RMDUser currentUser] currentCategory] == nil) {
        self.categoriesVC = [[RMDCategoriesTableViewController alloc] init];
        [self.navigationController pushViewController:self.categoriesVC animated:YES];
    } else {
        [self getData];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self setEditing:NO];
}

- (void)getData {
    self.currentCategory = [[RMDUser currentUser] currentCategory];
    self.navigationItem.title = [self.currentCategory name];
    self.cards = [self.currentCategory cards];
    [self.tableView reloadData];
}

- (void)addCard {
    RMDCardAdderViewController *cardAdderVC = [[RMDCardAdderViewController alloc] init];
    cardAdderVC.delegate = self;
    [self setEditing:NO animated:NO];
    [self.navigationController pushViewController:cardAdderVC animated:YES];
}

- (void)setNewCard:(NSString *)word definition:(NSString *)definition {
    NSLog(@"in card table");
    RMDCard *card = [[RMDCard alloc] initWithWord:word definition:definition];
    [[[RMDUser currentUser] currentCategory] addCard:card];
    [self getData];
}

- (void)setNewCategory:(NSString *)name {
    [[RMDUser currentUser] addCategory:name];
    [self getData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cards count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    RMDCard *card = [self.cards objectAtIndex:indexPath.row];
    cell.textLabel.text = card.word;
    cell.detailTextLabel.text = card.definition;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return true;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    RMDCard *card = [self.cards objectAtIndex:indexPath.row];
    [[RMDUser currentUser].currentCategory deleteCard:card];
    [self getData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.editing) {
        NSLog(@"editing");
    }
}
//TODO: add edit actions for row at index path

@end
