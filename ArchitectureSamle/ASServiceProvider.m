//
//  ASServiceProvider.m
//  ArchitectureSamle
//
//  Created by Karol Moluszys on 26.02.2016.
//  Copyright © 2016 Karol Moluszys. All rights reserved.
//

#import "ASServiceProvider.h"

@implementation ASServiceProvider

+ (ASSearchService *)searchService {
    return [ASSearchService create];
}

@end
