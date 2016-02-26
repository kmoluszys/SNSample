//
//  ASSearchDatabaseWorker.m
//  ArchitectureSamle
//
//  Created by Karol Moluszys on 26.02.2016.
//  Copyright © 2016 Karol Moluszys. All rights reserved.
//

#import "ASSearchDatabaseWorker.h"
#import "RACDatabaseQuery.h"
#import "ASSearchResultsDbEntity.h"

@implementation ASSearchDatabaseWorker

- (RACExecutor *)setSearchResults:(ASSearchResultsDbEntity *)results {
    return [RACRealmExecutor executorWithEngine:[RACSetRealmEngine new] queryBlock:^RACDatabaseQuery *{
        RACDatabaseQuery *query = [RACDatabaseQuery new];
        query.object = results;
        
        return query;
    }];
}

@end
