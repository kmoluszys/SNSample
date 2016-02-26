//
//  ASSearchQuery.m
//  ArchitectureSamle
//
//  Created by Karol Moluszys on 26.02.2016.
//  Copyright © 2016 Karol Moluszys. All rights reserved.
//

#import "ASSearchQuery.h"

@implementation ASSearchQuery

- (NSString *)serverUrl {
    return self.__baseUrl;
}

- (NSDictionary *)mapKeys {
    return @{@"searchString" : @"s"};
}

@end
