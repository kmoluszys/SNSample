//
//  SNBaseInternetQueryEngine
//
//  Created by Karol Moluszys on 30.11.2015.
//  Copyright © 2016 Speednet Sp. z o. o.. All rights reserved.
//

#import "RACInternetQueryEngine.h"

@interface SNBaseInternetQueryEngine : RACInternetQueryEngine
- (void)handleResponse:(NSURLResponse *)response responseObject:(NSDictionary *)responseObject error:(NSError *)error;
@end
