//
//  ViewController.m
//  ArchitectureSamle
//
//  Created by Karol Moluszys on 26.02.2016.
//  Copyright © 2016 Karol Moluszys. All rights reserved.
//

#import "ViewController.h"
#import "ASSearchResultsEntity.h"

@interface ViewController ()
@property (strong, nonatomic) ASSearchPresenter *presenter;
@property (strong, nonatomic) ASSearchResultsEntity *model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.presenter = [ASPresenterProvider searchPresenter];
    
    @weakify(self);
    [[self.presenter getSearchResultsWithSearchText:@"Batman"] subscribeNext:^(ASSearchResultsEntity *x) {
        @strongify(self);
        self.model = x;
    } error:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
