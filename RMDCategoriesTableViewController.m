//
//  RMDCategoriesTableViewController.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/23/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDCategoriesTableViewController.h"
#import "RMDUser.h"

@interface RMDCategoriesTableViewController ()

@property (nonatomic, strong) NSArray *categories;

@end

@implementation RMDCategoriesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.categories = [[[RMDUser currentUser] getCategories] allKeys];
    NSLog(@"categories: %@", self.categories);
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
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
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
