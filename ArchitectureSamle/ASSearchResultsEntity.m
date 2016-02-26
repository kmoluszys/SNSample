//
//	ASSearchResults.m
//
//	Create by Karol Moluszys on 26/2/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ASSearchResultsEntity.h"

@interface ASSearchResultsEntity ()
@end
@implementation ASSearchResultsEntity




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[@"Response"] isKindOfClass:[NSNull class]]){
		self.response = [dictionary[@"Response"] boolValue];
	}

	if(dictionary[@"Search"] != nil && [dictionary[@"Search"] isKindOfClass:[NSArray class]]){
		NSArray * searchDictionaries = dictionary[@"Search"];
		NSMutableArray * searchItems = [NSMutableArray array];
		for(NSDictionary * searchDictionary in searchDictionaries){
			ASSearchEntity * searchItem = [[ASSearchEntity alloc] initWithDictionary:searchDictionary];
			[searchItems addObject:searchItem];
		}
		self.search = searchItems;
	}
	if(![dictionary[@"totalResults"] isKindOfClass:[NSNull class]]){
		self.totalResults = dictionary[@"totalResults"];
	}	
	return self;
}
@end