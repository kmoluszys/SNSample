//
//  RLMBaseObject.h
//
//  Created by Karol Moluszys on 19.08.2015.
//  Copyright (c) 2015 Speednet Sp. z o. o.. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RLMString : RLMObject
@property NSString *value;
@end
RLM_ARRAY_TYPE(RLMString)

@interface RLMInteger : RLMObject
@property NSInteger value;
@end
RLM_ARRAY_TYPE(RLMInteger)

extern RLMString * rlm_String(NSString *value);
extern RLMInteger * rlm_Integer(NSInteger value);

@interface RLMBaseObject : RLMObject

@end
