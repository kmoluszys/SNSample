//
//  RACRealmNotifier.m
//  BeautyPlanner
//
//  Created by Karol Moluszys on 02.07.2015.
//  Copyright (c) 2015 Karol Moluszys. All rights reserved.
//

#import "RACRealmNotifier.h"
#import "RACDatabaseQuery.h"

@implementation RACRealmNotifier

- (void)sendNext:(RACDatabaseQuery *)nextObject {
	if (![nextObject isKindOfClass:[RACDatabaseQuery class]]) {
		@throw [NSException exceptionWithName:@"RACRealmNotifier - Cast error" reason:@"sendNext: method requires RACDatabaseQuery argument" userInfo:nil];
	}
	
	[super sendNext:nextObject];
}

- (void)sendSuccess:(RACDatabaseQuery *)successObject {
	if (![successObject isKindOfClass:[RACDatabaseQuery class]]) {
		@throw [NSException exceptionWithName:@"RACRealmNotifier - Cast error" reason:@"sendSuccess: method requires RACDatabaseQuery argument" userInfo:nil];
	}
	
	[super sendSuccess:successObject];
}

@end
