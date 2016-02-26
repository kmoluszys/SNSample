//
//	ASSearchResults.h
//
//	Create by Karol Moluszys on 26/2/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <Realm/Realm.h>
#import "ASBaseEntity.h"
RLM_ARRAY_TYPE(ASSearch)
@class ASSearchDbEntity;

@interface ASSearchResultsDbEntity : ASBaseEntity

@property (nonatomic, assign) BOOL response;
@property (nonatomic, strong) RLMArray<ASSearch> * search;
@property (nonatomic, strong) NSString * totalResults;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end