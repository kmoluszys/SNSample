//
//  BPRealmExecutor.m
//  BeautyPlanner
//
//  Created by Karol Moluszys on 02.07.2015.
//  Copyright (c) 2015 Karol Moluszys. All rights reserved.
//

#import "RACRealmExecutor.h"
#import "RACRealmEngine+Private.h"
#import "RACRealmNotifier.h"

@interface RACRealmExecutor ()
@property (strong, nonatomic) RACRealmEngine *engine;
@property (copy, nonatomic) RACRealmExecutorBlock realmExecutorBlock;
@end

@implementation RACRealmExecutor

+ (instancetype)executorWithEngine:(RACRealmEngine *)engine queryBlock:(RACRealmExecutorBlock)realmExecutorBlock {
	RACRealmExecutor *executor = [[[self class] alloc] init];
	executor.realmExecutorBlock = realmExecutorBlock;
	executor.engine = engine;
	
	return executor;
}

- (RACSignal *)prepareRACSignal {
	return [[self querySignalHandler] flattenMap:^RACStream *(RACDatabaseQuery *query) {
		return [self engineSignalHandlerWithQuery:query];
	}];
}

- (RACSignal *)querySignalHandler {
	return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
		RACRealmNotifier *notifier = [RACRealmNotifier notifierWithSubscriber:subscriber];
		[notifier sendSuccess:self.realmExecutorBlock()];
		
		return nil;
	}];
}

- (RACSignal *)engineSignalHandlerWithQuery:(RACDatabaseQuery *)query {
	return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
		[self.engine initializeEngineWithQuery:query notifier:[RACNotifier notifierWithSubscriber:subscriber]];
		
		[self.engine start];
		
		return [RACDisposable disposableWithBlock:^{
			self.engine.privateDisposed = YES;
			[self.engine cancel];
		}];
		
	}];
}

@end
