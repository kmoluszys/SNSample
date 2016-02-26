//
//  RACRealmEngine+Private.h
//
//  Created by Karol Moluszys on 02.07.2015.
//  Copyright (c) 2015 Karol Moluszys. All rights reserved.
//

#import "RACRealmEngine.h"

@class RACDatabaseQuery;
@class RACNotifier;

@interface RACRealmEngine ()
@property (assign, nonatomic) BOOL privateDisposed;

- (void)initializeEngineWithQuery:(RACDatabaseQuery *)query notifier:(RACNotifier *)notifier;

@end
