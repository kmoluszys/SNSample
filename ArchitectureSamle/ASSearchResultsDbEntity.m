//
//	ASSearchResults.m
//
//	Create by Karol Moluszys on 26/2/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ASSearchResultsDbEntity.h"
#import "ASSearchDbEntity.h"

@interface ASSearchResultsDbEntity ()
@end
@implementation ASSearchResultsDbEntity




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	if(dictionary == nil || [dictionary isKindOfClass:[NSNull class]]){
		return nil;
	}
	self = [super init];

	if(![dictionary[@"Response"] isKindOfClass:[NSNull class]]){
		self.response = [dictionary[@"Response"] boolValue];
	}

	if(dictionary[@"Search"] != nil && ![dictionary[@"Search"] isKindOfClass:[NSNull class]]){
		NSArray * searchDictionaries = dictionary[@"Search"];
		RLMArray * searchItems = [[RLMArray alloc] initWithObjectClassName:[ASSearchDbEntity className]];
		for(NSDictionary * searchDictionary in searchDictionaries){
			ASSearchDbEntity * searchItem = [[ASSearchDbEntity alloc] initWithDictionary:searchDictionary];
			[searchItems addObject:searchItem];
		}
		self.search = (RLMArray<ASSearch> *)searchItems;
	}
	if(![dictionary[@"totalResults"] isKindOfClass:[NSNull class]]){
		self.totalResults = dictionary[@"totalResults"];
	}

	return self;
}
@end