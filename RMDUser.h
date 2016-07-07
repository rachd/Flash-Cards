//
//  RMDUser.h
//  Flash Cards
//
//  Created by Rachel Dorn on 6/23/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RMDCategory.h"

@interface RMDUser : NSObject

@property (nonatomic, strong) RMDCategory *currentCategory;

+ (RMDUser *)currentUser;

+ (void)login:(NSArray *)categories success:(void (^)(void))success;
- (void)logout;
- (void)addCategory:(NSString *)name;
- (void)deleteCategory:(RMDCategory *)category;
- (NSArray *)getCategories;

@end
