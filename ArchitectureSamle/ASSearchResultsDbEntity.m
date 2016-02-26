//
//	ASSearchResults.m
//
//	Create by Karol Moluszys on 26/2/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import "ASSearchResultsDbEntity.h"
#import "ASSearchDbEntity.h"

@implementation ASSearchResultsDbEntity

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
	if (!dictionary || [dictionary isKindOfClass:[NSNull class]]) {
		return nil;
	}
    
	self = [super init];

    self.idx = arc4random_uniform(5000);
    
	if (![dictionary[@"Response"] isKindOfClass:[NSNull class]]) {
		self.response = [dictionary[@"Response"] boolValue];
	}

	if (![dictionary[@"totalResults"] isKindOfClass:[NSNull class]]) {
		self.totalResults = dictionary[@"totalResults"];
	}
    
    if (dictionary[@"Search"] && ![dictionary[@"Search"] isKindOfClass:[NSNull class]]) {
        NSArray *searchDictionaries = dictionary[@"Search"];
        
        RLMArray *searchItems = [[RLMArray alloc] initWithObjectClassName:[ASSearchDbEntity className]];
        
        for(NSDictionary *searchDictionary in searchDictionaries) {
            ASSearchDbEntity *searchItem = [[ASSearchDbEntity alloc] initWithDictionary:searchDictionary];
            [searchItems addObject:searchItem];
        }
        
        self.search = (RLMArray<ASSearchDbEntity> *)searchItems;
    }

	return self;
}

- (NSDictionary *)toDictionary {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    dictionary[@"Response"] = @(self.response);
    
    if (self.search) {
        NSMutableArray *dictionaryElements = [NSMutableArray array];
        
        for(ASSearchDbEntity *searchElement in self.search) {
            [dictionaryElements addObject:[searchElement toDictionary]];
        }
        
        dictionary[@"Search"] = dictionaryElements;
    }
    
    if (self.totalResults) {
        dictionary[@"totalResults"] = self.totalResults;
    }
    
    return dictionary;
    
}

+ (NSString *)primaryKey {
    return @"idx";
}

@end