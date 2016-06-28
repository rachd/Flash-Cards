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

@interface RMDCategoriesTableViewController ()

@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation RMDCategoriesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.95 green:0.66 blue:0.57 alpha:1.0];
    self.categories = [[[RMDUser currentUser] getCategories] allKeys];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:self.tableView];
    
    UIBarButtonItem *blankItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self.navigationController action:nil];
    self.navigationItem.leftBarButtonItem = blankItem;
    self.navigationItem.title = @"Card Sets";
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    
    UIBarButtonItem *addCardSetButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCardSet)];
    self.navigationItem.rightBarButtonItem = addCardSetButton;
}

- (void)addCardSet {
    RMDCategoryAdderViewController *cardSetAdderVC = [[RMDCategoryAdderViewController alloc] init];
    cardSetAdderVC.delegate = self.navigationController.viewControllers[0];
    [self setEditing:NO animated:NO];
    [self.navigationController pushViewController:cardSetAdderVC animated:YES];
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
    
    cell.textLabel.text = [self.categories objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [RMDUser currentUser].currentCategory = [self.categories objectAtIndex:indexPath.row];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
