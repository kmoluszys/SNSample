//
//  SNBaseQuery
//
//  Created by Karol Moluszys on 22.06.2015.
//  Copyright © 2016 Speednet Sp. z o. o.. All rights reserved.
//

#import "RACInternetQuery.h"

@interface SNBaseQuery : RACInternetQuery
@property (strong, nonatomic) NSString *__baseUrl;
@property (strong, nonatomic) NSString *__token;

- (NSString *)prepareQueryComponentForField:(NSString *)field fromDictionary:(NSDictionary *)dictionary;
- (NSString *)method;
@end
