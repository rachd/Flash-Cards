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

@interface RMDCardsTableViewController ()

@property (nonatomic, strong) NSDictionary *cards;
@property (nonatomic, strong) NSString *currentCategory;
@property (nonatomic, strong) NSArray *allKeys;
@property (nonatomic, strong) RMDCategoriesTableViewController *categoriesVC;

@end

@implementation RMDCardsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    UIBarButtonItem *addCard = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCard)];
    self.navigationItem.rightBarButtonItem = addCard;
}

- (void)viewWillAppear:(BOOL)animated {
    if ([[RMDUser currentUser] currentCategory] == nil) {
        self.categoriesVC = [[RMDCategoriesTableViewController alloc] initWithStyle:UITableViewStylePlain];
        [self.navigationController presentViewController:self.categoriesVC animated:YES completion:nil];
    } else {
        [self getData];
    }
}

- (void)getData {
    self.currentCategory = [[RMDUser currentUser] currentCategory];
    self.cards = [[[RMDUser currentUser] getCategories] objectForKey:self.currentCategory];
    self.allKeys = [self.cards allKeys];
    [self.tableView reloadData];
}

- (void)addCard {
    RMDNewCardView *newCardView = [[RMDNewCardView alloc] initWithFrame:self.view.frame];
    newCardView.delegate = self;
    [self.view addSubview:newCardView];
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
    return cell;
}

@end
