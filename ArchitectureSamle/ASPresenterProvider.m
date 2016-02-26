//
//  ASPresenterProvider.m
//  ArchitectureSamle
//
//  Created by Karol Moluszys on 26.02.2016.
//  Copyright © 2016 Karol Moluszys. All rights reserved.
//

#import "ASPresenterProvider.h"

@implementation ASPresenterProvider

+ (ASSearchPresenter *)searchPresenter {
    return [ASSearchPresenter create];
}

@end
