//
//  RACRealmExecutor.m
//
//  Created by Karol Moluszys on 02.07.2015.
//  Copyright (c) 2015 Karol Moluszys. All rights reserved.
//

#import "RACRealmEngine.h"
#import "RACRealmEngine+Private.h"
#import "RACNotifier.h"
#import "RACDatabaseQuery.h"

@interface RACRealmEngine ()
@property (readwrite, strong, nonatomic) RACNotifier *notifier;
@property (readwrite, strong, nonatomic) RACDatabaseQuery *query;
@property (readwrite, strong, nonatomic) RLMRealm *realm;
@end

@implementation RACRealmEngine

- (void)initializeEngineWithQuery:(RACDatabaseQuery *)query notifier:(RACNotifier *)notifier {
	self.notifier = notifier;
	self.query = query;
	self.realm = [RLMRealm defaultRealm];
	self.privateDisposed = NO;
}

- (BOOL)isDisposed {
	return self.privateDisposed;
}

- (void)start {
}

- (void)cancel {
}

@end
