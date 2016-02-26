//
//  YDPBaseQuery.m
//  Didactus
//
//  Created by Karol Moluszys on 22.06.2015.
//  Copyright © 2016 Speednet Sp. z o. o.. All rights reserved.
//

#import "SNBaseQuery.h"

@implementation SNBaseQuery

+ (instancetype)new {
	SNBaseQuery *query = [super new];
	query.__baseUrl = BaseURL;

	return query;
}

- (NSString *)prepareQueryComponentForField:(NSString *)field fromDictionary:(NSDictionary *)dictionary {
	if (!dictionary) {
		return nil;
	}
	
	NSMutableArray *queryComponents = [NSMutableArray new];
	
	for (NSString *key in dictionary) {
		[queryComponents addObject:[NSString stringWithFormat:@"%@[%@]=%@", field, key, [dictionary[key] stringValue]]];
	}
	
	return [queryComponents componentsJoinedByString:@"&"];
}

- (NSString *)method {
    return @"";
}

@end
