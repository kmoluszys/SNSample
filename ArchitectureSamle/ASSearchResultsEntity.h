//
//	ASSearchResults.h
//
//	Create by Karol Moluszys on 26/2/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "ASBaseEntity.h"
#import "ASSearchEntity.h"

@interface ASSearchResultsEntity : ASBaseEntity

@property (nonatomic, assign) BOOL response;
@property (nonatomic, strong) NSArray * search;
@property (nonatomic, strong) NSString * totalResults;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end