//
//  ASSearchDatabaseWorker.h
//  ArchitectureSamle
//
//  Created by Karol Moluszys on 26.02.2016.
//  Copyright © 2016 Karol Moluszys. All rights reserved.
//

#import <Speednet-Architecture-iOS/Speednet-Architecture-iOS.h>

@class ASSearchResultsDbEntity;
@interface ASSearchDatabaseWorker : SNWorker
- (RACExecutor *)setSearchResults:(ASSearchResultsDbEntity *)results;
@end
