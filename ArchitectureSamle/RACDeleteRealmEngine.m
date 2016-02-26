//
//  MCDeleteRealmEngine.m
//  MyClap
//
//  Created by Karol Moluszys on 02.11.2015.
//  Copyright © 2015 Playsoft. All rights reserved.
//

#import "RACDeleteRealmEngine.h"
#import "RACDatabaseQuery.h"

@implementation RACDeleteRealmEngine

- (void)start {
	[self.realm beginWriteTransaction];
    [self.realm deleteObject:self.query.object];
    [self.realm commitWriteTransaction];
    [self.notifier sendSuccess:@YES];
}

- (void)cancel {
	
}

@end
