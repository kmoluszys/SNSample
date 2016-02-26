//
//  RACRealmExecutor.h
//
//  Created by Karol Moluszys on 02.07.2015.
//  Copyright (c) 2015 Karol Moluszys. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACNotifier;
@class RACDatabaseQuery;
@interface RACRealmEngine : NSObject

/**
 *  Notifier instance.
 */
@property (readonly, strong, nonatomic) RACNotifier *notifier;

/**
 *  Query.
 */
@property (readonly, strong, nonatomic) RACDatabaseQuery *query;

/**
 *  Realm.
 */
@property (readonly, strong, nonatomic) RLMRealm *realm;

/**
 *  Determine if query is disposed.
 */
@property (readonly, assign, nonatomic, getter=isDisposed) BOOL disposed;

/**
 *  Starts executing query.
 */
- (void)start;

/**
 *  Cancel executing query.
 */
- (void)cancel;

@end
