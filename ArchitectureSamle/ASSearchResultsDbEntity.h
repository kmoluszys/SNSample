//
//	ASSearchResults.h
//
//	Create by Karol Moluszys on 26/2/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <Realm/Realm.h>
RLM_ARRAY_TYPE(ASSearchDbEntity)
@class ASSearchDbEntity;

@interface ASSearchResultsDbEntity : RLMObject
@property (assign, nonatomic) NSInteger idx;
@property (assign, nonatomic) BOOL response;
@property (strong, nonatomic) RLMArray<ASSearchDbEntity> *search;
@property (strong, nonatomic) NSString *totalResults;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)toDictionary;
@end