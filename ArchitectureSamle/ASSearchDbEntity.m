//
//	ASSearch.m
//
//	Create by Karol Moluszys on 26/2/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ASSearchDbEntity.h"
#import "ASSearchResults.h"

@interface ASSearchDbEntity ()
@end
@implementation ASSearchDbEntity




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	if(dictionary == nil || [dictionary isKindOfClass:[NSNull class]]){
		return nil;
	}
	self = [super init];

	if(![dictionary[@"aSSearchResults"] isKindOfClass:[NSNull class]]){
		self.aSSearchResults = [[ASSearchResults alloc] initWithDictionary:dictionary[@"aSSearchResults"]];
	}

	if(![dictionary[@"Poster"] isKindOfClass:[NSNull class]]){
		self.poster = dictionary[@"Poster"];
	}

	if(![dictionary[@"Title"] isKindOfClass:[NSNull class]]){
		self.title = dictionary[@"Title"];
	}

	if(![dictionary[@"Type"] isKindOfClass:[NSNull class]]){
		self.type = dictionary[@"Type"];
	}

	if(![dictionary[@"Year"] isKindOfClass:[NSNull class]]){
		self.year = dictionary[@"Year"];
	}

	if(![dictionary[@"imdbID"] isKindOfClass:[NSNull class]]){
		self.imdbID = dictionary[@"imdbID"];
	}

	return self;
}
@end