//
//  YDPBaseInternetQueryEngine.m
//  Didactus
//
//  Created by Karol Moluszys on 30.11.2015.
//  Copyright © 2016 Speednet Sp. z o. o.. All rights reserved.
//

#import "SNBaseInternetQueryEngine.h"
#import "YDPBaseQuery.h"
#import "YDPMockObjectProvider.h"
#import "YDPLoginQuery.h"

@implementation SNBaseInternetQueryEngine

- (AFHTTPSessionManager *)prepareSessionManager:(NSError **)error {
    RACInternetQuery *internetQuery = (RACInternetQuery *)self.query;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.protocolClasses = @[[NFXProtocol class]];
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:internetQuery.serverUrl] sessionConfiguration:configuration];
    
    sessionManager.securityPolicy.allowInvalidCertificates = YES;
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    [securityPolicy setAllowInvalidCertificates:YES];
    securityPolicy.validatesDomainName = NO;
    sessionManager.securityPolicy = securityPolicy;
    
    sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    return sessionManager;
}

- (NSMutableURLRequest *)prepareMutableUrlRequest:(NSError *__autoreleasing *)error {
    YDPBaseQuery *internetQuery = (YDPBaseQuery *)self.query;
    NSDictionary *parameters = internetQuery.queryContent;
    parameters = parameters.count > 0 ? parameters : nil;
    
    NSString *method = @"";
    
    if ([self isKindOfClass:[YDPPostInternetQueryEngine class]]) {
        method = @"POST";
    } else if ([self isKindOfClass:[YDPGetInternetQueryEngine class]]) {
        method = @"GET";
    } else if ([self isKindOfClass:[YDPDeleteInternetQueryEngine class]]) {
        method = @"DELETE";
    } else if ([self isKindOfClass:[YDPPutInternetQueryEngine class]]) {
        method = @"PUT";
    } else if ([self isKindOfClass:[YDPPatchInternetQueryEngine class]]) {
        method = @"PATCH";
    } else {
        NSLog(@"Unsupported Engine Type: %@", NSStringFromClass([self class]));
    }
    
    NSMutableURLRequest *request = [self.sessionManager.requestSerializer requestWithMethod:method URLString:internetQuery.serverUrl parameters:parameters error:nil];
    self.sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    if ([self.query isKindOfClass:[YDPBaseQuery class]]) {
        if (((YDPBaseQuery *)self.query).__token) {
            [request setValue:((YDPBaseQuery *)self.query).__token forHTTPHeaderField:RequestTokenHeaderFieldKey];
        }
    }
    
    return request;
}

- (void)handleResponse:(NSURLResponse *)response responseObject:(NSDictionary *)responseObject error:(NSError *)error {
    if (error) {
        [self.notifier sendError:[NSError errorWithError:error responseObject:responseObject]];
        return;
    }
    
    if ([self.query isKindOfClass:[YDPLoginQuery class]]) {
        [self.notifier sendSuccess:((NSHTTPURLResponse *)response).allHeaderFields[@"Set-Cookie"]];
    } else {
        [self.notifier sendSuccess:[responseObject dictionaryByRemovingNullValueKeys]];
    }
}

- (void)start {
#ifdef MOCK_TARGET
    id result = [YDPMockObjectProvider responseForQuery:(RACInternetQuery *)self.query];
    if ([result isKindOfClass:[NSDictionary class]]) {
        if ([self.query isKindOfClass:[YDPLoginQuery class]]) {
            [self.notifier sendSuccess:@"token"];
        } else {
            [self.notifier sendSuccess:result];
        }
    } else {
        [self.notifier sendError:result];
    }
#else
    if (![YDPNetworkUtils networkDisabled]) {
        [super start];
    } else {
        [self.notifier sendError:[NSError errorWithDomain:YDPErrorDomain code:-1011 userInfo:@{NSLocalizedDescriptionKey : @"Internet connection has been disabled by user"}]];
    }
#endif
}

@end
