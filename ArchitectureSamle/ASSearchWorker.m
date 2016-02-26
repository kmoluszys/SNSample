//
//  ASSearchWorker.m
//  ArchitectureSamle
//
//  Created by Karol Moluszys on 26.02.2016.
//  Copyright © 2016 Karol Moluszys. All rights reserved.
//

#import "ASSearchWorker.h"
#import "ASSearchQuery.h"

@implementation ASSearchWorker

- (RACExecutor *)getSearchResultsWithSearchText:(NSString *)searchText {
    return [RACQueryExecutor executorWithEngine:[SNGetInternetQueryEngine new] queryBlock:^(RACQueryNotifier *notifier) {
        ASSearchQuery *query = [ASSearchQuery new];
        query.searchString = searchText;
        
        [notifier sendSuccess:query];
    }];
}

@end
