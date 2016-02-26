//
//  ASSearchService.m
//  ArchitectureSamle
//
//  Created by Karol Moluszys on 26.02.2016.
//  Copyright © 2016 Karol Moluszys. All rights reserved.
//

#import "ASSearchService.h"
#import "ASSearchResultsDbEntity.h"
#import "ASSearchResultsEntity.h"

@implementation ASSearchService

- (RACSignal *)getSearchResultsWithSearchText:(NSString *)searchText {
    return [[[[[ASWorkerProvider searchWorker] getSearchResultsWithSearchText:searchText].signal map:^id(NSDictionary *value) {
        return [[ASSearchResultsDbEntity alloc] initWithDictionary:value];
    }] flattenMap:^RACStream *(ASSearchResultsDbEntity *value) {
        return [[ASWorkerProvider searchDatabaseWorker] setSearchResults:value].signal;
    }] map:^id(ASSearchResultsDbEntity *value) {
        NSDictionary *dictionary = [value toDictionary];
        
        return [[ASSearchResultsEntity alloc] initWithDictionary:dictionary];
    }];
}

@end
