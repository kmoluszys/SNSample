//
//	ASSearch.m
//
//	Create by Karol Moluszys on 26/2/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import "ASSearchDbEntity.h"

@implementation ASSearchDbEntity

/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
	if (!dictionary || [dictionary isKindOfClass:[NSNull class]]) {
		return nil;
	}
    
	self = [super init];

	if (![dictionary[@"Poster"] isKindOfClass:[NSNull class]]) {
		self.poster = dictionary[@"Poster"];
	}

	if (![dictionary[@"Title"] isKindOfClass:[NSNull class]]) {
		self.title = dictionary[@"Title"];
	}

	if (![dictionary[@"Type"] isKindOfClass:[NSNull class]]) {
		self.type = dictionary[@"Type"];
	}

	if (![dictionary[@"Year"] isKindOfClass:[NSNull class]]) {
		self.year = dictionary[@"Year"];
	}

	if (![dictionary[@"imdbID"] isKindOfClass:[NSNull class]]) {
		self.imdbID = dictionary[@"imdbID"];
	}

	return self;
}

- (NSDictionary *)toDictionary {
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    
    if (self.poster) {
        dictionary[@"Poster"] = self.poster;
    }
    
    if (self.title) {
        dictionary[@"Title"] = self.title;
    }
    
    if (self.type) {
        dictionary[@"Type"] = self.type;
    }
    
    if (self.year) {
        dictionary[@"Year"] = self.year;
    }
    
    if (self.imdbID) {
        dictionary[@"imdbID"] = self.imdbID;
    }
    
    return dictionary;
}

+ (NSString *)primaryKey {
    return @"title";
}

@end