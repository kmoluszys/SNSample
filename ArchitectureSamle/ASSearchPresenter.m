//
//  ASSearchPresenter.m
//  ArchitectureSamle
//
//  Created by Karol Moluszys on 26.02.2016.
//  Copyright © 2016 Karol Moluszys. All rights reserved.
//

#import "ASSearchPresenter.h"

@implementation ASSearchPresenter

- (RACSignal *)getSearchResultsWithSearchText:(NSString *)searchText {
    return [[[[ASServiceProvider searchService] getSearchResultsWithSearchText:searchText] subscribeOnBackgroundThread] deliverOnMainThread];
}

@end
