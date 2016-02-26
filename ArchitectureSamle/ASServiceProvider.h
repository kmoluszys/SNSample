//
//  ASServiceProvider.h
//  ArchitectureSamle
//
//  Created by Karol Moluszys on 26.02.2016.
//  Copyright © 2016 Karol Moluszys. All rights reserved.
//

#import <Speednet-Architecture-iOS/Speednet-Architecture-iOS.h>
#import "ASSearchService.h"

@interface ASServiceProvider : SNServiceProvider
+ (ASSearchService *)searchService;
@end
