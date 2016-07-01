//
//  RMDCategoriesTableViewController.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/23/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDCategoriesTableViewController.h"
#import "RMDUser.h"
#import "RMDCategoryAdderViewController.h"
#import "RMDCardsTableViewController.h"
#import "RMDConstants.h"

@interface RMDCategoriesTableViewController ()

@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation RMDCategoriesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
    self.view.backgroundColor = [RMDConstants backgroundColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [RMDConstants backgroundColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.allowsSelectionDuringEditing = YES;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:self.tableView];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"Card Sets";
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    UIBarButtonItem *addCardSetButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCardSet)];
    self.navigationItem.rightBarButtonItem = addCardSetButton;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.tableView setEditing:NO];
}

- (void)addCardSet {
    RMDCategoryAdderViewController *cardSetAdderVC = [[RMDCategoryAdderViewController alloc] init];
    cardSetAdderVC.delegate = self.navigationController.viewControllers[0];
    [self setEditing:NO animated:NO];
    [self.navigationController pushViewController:cardSetAdderVC animated:YES];
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    if (editing) {
        [self.tableView setEditing:YES animated:YES];
    }
}

- (void)getData {
    self.categories = [[RMDUser currentUser] getCategories];
    [self.tableView setEditing:NO];
    [self.tableView reloadData];
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
    return [self.categories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    RMDCategory *category = [self.categories objectAtIndex:indexPath.row];
    cell.textLabel.text = category.name;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return true;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.tableView.editing) {
        RMDCategory *category = [self.categories objectAtIndex:indexPath.row];
        RMDCategoryAdderViewController *adderVC = [[RMDCategoryAdderViewController alloc] init];
        adderVC.category = category;
        [self.navigationController pushViewController:adderVC animated:YES];
    } else {
        [RMDUser currentUser].currentCategory = [self.categories objectAtIndex:indexPath.row];
        RMDCardsTableViewController *cardsVC = self.navigationController.viewControllers[0];
        [cardsVC getData];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    RMDCategory *category = [self.categories objectAtIndex:indexPath.row];
    [[RMDUser currentUser] deleteCategory:category];
    [self getData];
}

@end
