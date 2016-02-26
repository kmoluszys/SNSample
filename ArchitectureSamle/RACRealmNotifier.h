//
//  RACRealmNotifier.h
//  BeautyPlanner
//
//  Created by Karol Moluszys on 02.07.2015.
//  Copyright (c) 2015 Karol Moluszys. All rights reserved.
//

#import "RACNotifier.h"

@class RLMObject;
@interface RACRealmNotifier : RACNotifier
/**
 *  Sends the next value to subscribers.
 *
 *  @param nextObject The value to send. This can be `nil`.
 */
- (void)sendNext:(RACDatabaseQuery *)nextObject;

/**
 *  Sends the next value and completed to subscribers.
 *  This terminates the subscription, and invalidates the subscriber (such that it cannot subscribe to anything else in the future).
 *
 *  @param successObject The value to send. This can be `nil`.
 */
- (void)sendSuccess:(RACDatabaseQuery *)successObject;
@end
