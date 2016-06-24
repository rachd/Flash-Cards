//
//  RMDUser.m
//  Flash Cards
//
//  Created by Rachel Dorn on 6/23/16.
//  Copyright © 2016 Rachel Dorn. All rights reserved.
//

#import "RMDUser.h"

@implementation RMDUser

+ (RMDUser *)currentUser {
    RMDUser *user = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"user"]];
    return user;
}

+ (void)login:(NSString *)uid success:(void (^)(void))success {
    RMDUser *user = [[RMDUser alloc] init];
    NSData *encodedUserObject = [NSKeyedArchiver archivedDataWithRootObject:user];
    
    [[NSUserDefaults standardUserDefaults] setObject:encodedUserObject forKey:@"user"];
}

- (void)logout {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"user"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.categories = [decoder decodeObjectForKey:@"categories"];
        self.cards = [decoder decodeObjectForKey:@"cards"];
        self.currentCategory = [decoder decodeObjectForKey:@"currentCategory"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.categories forKey:@"categories"];
    [encoder encodeObject:self.cards forKey:@"cards"];
    [encoder encodeObject:self.currentCategory forKey:@"currentCategory"];
}

- (id)copyWithZone:(NSZone *)zone {
    RMDUser *objectCopy = [[RMDUser allocWithZone:zone] init];
    [objectCopy setCategories:self.categories];
    [objectCopy setCards:self.cards];
    [objectCopy setCurrentCategory:self.currentCategory];
    return objectCopy;
}

@end
