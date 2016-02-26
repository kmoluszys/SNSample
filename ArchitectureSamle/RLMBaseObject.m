//
//  RLMBaseObject.h
//
//  Created by Karol Moluszys on 19.08.2015.
//  Copyright (c) 2015 Speednet Sp. z o. o.. All rights reserved.
//

#import "RLMBaseObject.h"

@implementation RLMString

@end

@implementation RLMInteger

@end

RLMString * rlm_String(NSString *value) {
	RLMString *string = [RLMString new];
	string.value = value;
	
	return string;
}

extern RLMInteger * rlm_Integer(NSInteger value) {
    RLMInteger *integer = [RLMInteger new];
    integer.value = value;
    
    return integer;
}

@implementation RLMBaseObject

@end
