//
//  RACSetRealmEngine.m
//  BeautyPlanner
//
//  Created by Karol Moluszys on 02.07.2015.
//  Copyright (c) 2015 Karol Moluszys. All rights reserved.
//

#import "RACSetRealmEngine.h"
#import "RACDatabaseQuery.h"

@implementation RACSetRealmEngine

- (void)start {
    [self.realm beginWriteTransaction];
    [self.realm addOrUpdateObject:self.query.object];
    [self.realm commitWriteTransaction];
    [self.notifier sendSuccess:self.query.object];
}

- (void)cancel {

}

@end
