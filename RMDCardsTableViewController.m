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

@interface RMDCardsTableViewController () <RMDCardAdderDelegate>

@property (nonatomic, strong) NSDictionary *cards;
@property (nonatomic, strong) NSString *currentCategory;
@property (nonatomic, strong) NSArray *allKeys;
@property (nonatomic, strong) RMDCategoriesTableViewController *categoriesVC;

@end

@implementation RMDCardsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.95 green:0.66 blue:0.57 alpha:1.0];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    UIBarButtonItem *addCardButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCard)];
    self.navigationItem.rightBarButtonItem = addCardButton;
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)viewWillAppear:(BOOL)animated {
    if ([[RMDUser currentUser] currentCategory] == nil) {
        NSLog(@"if");
        self.categoriesVC = [[RMDCategoriesTableViewController alloc] init];
        [self.navigationController pushViewController:self.categoriesVC animated:YES];
    } else {
        NSLog(@"else");
        [self getData];
    }
}

- (void)getData {
    self.currentCategory = [[RMDUser currentUser] currentCategory];
    self.navigationItem.title = [[RMDUser currentUser] currentCategory];
    self.cards = [[[RMDUser currentUser] getCategories] objectForKey:self.currentCategory];
    self.allKeys = [self.cards allKeys];
    [self.tableView reloadData];
}

- (void)addCard {
    RMDCardAdderViewController *cardAdderVC = [[RMDCardAdderViewController alloc] init];
    cardAdderVC.delegate = self;
    [self setEditing:NO animated:NO];
    [self.navigationController pushViewController:cardAdderVC animated:YES];
}

- (void)setNewCard:(NSString *)keyValue object:(NSString *)objectValue {
    [[RMDUser currentUser] addCard:keyValue value:objectValue];
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
    return [self.allKeys count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    cell.textLabel.text = [self.allKeys objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.cards objectForKey:[self.allKeys objectAtIndex:indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return true;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [[RMDUser currentUser] deleteCard:[self.allKeys objectAtIndex:indexPath.row]];
    [self getData];
}

//TODO: add edit actions for row at index path

@end
