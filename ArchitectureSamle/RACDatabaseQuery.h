//
//  RACDatabaseQuery.h
//  BeautyPlanner
//
//  Created by Karol Moluszys on 06.07.2015.
//  Copyright (c) 2015 Karol Moluszys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RACDatabaseQuery : NSObject
@property (strong, nonatomic) RLMObject *object;
@property (strong, nonatomic) NSPredicate *predicate;
@end
