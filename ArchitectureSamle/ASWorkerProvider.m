//
//  ASWorkerProvider.m
//  ArchitectureSamle
//
//  Created by Karol Moluszys on 26.02.2016.
//  Copyright © 2016 Karol Moluszys. All rights reserved.
//

#import "ASWorkerProvider.h"

@implementation ASWorkerProvider

+ (ASSearchWorker *)searchWorker {
    return [ASSearchWorker create];
}

+ (ASSearchDatabaseWorker *)searchDatabaseWorker {
    return [ASSearchDatabaseWorker create];
}

@end
