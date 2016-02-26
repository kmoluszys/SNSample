//
//  ASWorkerProvider.h
//  ArchitectureSamle
//
//  Created by Karol Moluszys on 26.02.2016.
//  Copyright © 2016 Karol Moluszys. All rights reserved.
//

#import <Speednet-Architecture-iOS/Speednet-Architecture-iOS.h>
#import "ASSearchWorker.h"
#import "ASSearchDatabaseWorker.h"

@interface ASWorkerProvider : SNWorkerProvider

+ (ASSearchWorker *)searchWorker;
+ (ASSearchDatabaseWorker *)searchDatabaseWorker;
@end
