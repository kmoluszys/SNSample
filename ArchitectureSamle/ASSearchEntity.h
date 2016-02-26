//
//	ASSearch.h
//
//	Create by Karol Moluszys on 26/2/2016
//	Copyright © 2016. All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "ASBaseEntity.h"

@interface ASSearchEntity : ASBaseEntity

@property (nonatomic, strong) NSString * poster;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * year;
@property (nonatomic, strong) NSString * imdbID;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end