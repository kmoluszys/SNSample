//
//  RACGetRealmEngine
//
//  Created by Karol Moluszys on 02.07.2015.
//  Copyright (c) 2015 Karol Moluszys. All rights reserved.
//

#import "RACGetRealmEngine.h"
#import "RACDatabaseQuery.h"

@implementation RACGetRealmEngine

- (void)start {
	RLMResults *result;
	
	if (!self.query.predicate) {
		result = [[self.query.object class] allObjects];
	} else {
		result = [[self.query.object class] objectsWithPredicate:self.query.predicate];
	}
	
	[self.notifier sendSuccess:result];
}

- (void)cancel {
	
}

@end
