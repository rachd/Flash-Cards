//
//  RMDUser.h
//  Flash Cards
//
//  Created by Rachel Dorn on 6/23/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RMDUser : NSObject

@property (nonatomic, strong) NSDictionary *categories;
@property (nonatomic, strong) NSString *currentCategory;

+ (RMDUser *)currentUser;

+ (void)login:(void (^)(void))success;
- (void)logout;

@end
