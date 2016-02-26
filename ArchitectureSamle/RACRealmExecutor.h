//
//  BPRealmExecutor.h
//  BeautyPlanner
//
//  Created by Karol Moluszys on 02.07.2015.
//  Copyright (c) 2015 Karol Moluszys. All rights reserved.
//

#import "RACExecutor.h"

@class RACRealmNotifier;
@class RACRealmEngine;
typedef RACDatabaseQuery * (^RACRealmExecutorBlock) ();

/**
 *  Executes the work specified in block using engine.
 */
@interface RACRealmExecutor : RACExecutor

/**
 *  Create instance of query executor.
 *
 *  @param engine             Engine instance.
 *  @param realmExecutorBlock Cold executor.
 *
 *  @return Realm executor instance.
 */
+ (instancetype)executorWithEngine:(RACRealmEngine *)engine queryBlock:(RACRealmExecutorBlock)realmExecutorBlock;
@end
