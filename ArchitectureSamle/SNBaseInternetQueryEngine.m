//
//  SNBaseInternetQueryEngine
//
//  Created by Karol Moluszys on 30.11.2015.
//  Copyright © 2016 Speednet Sp. z o. o.. All rights reserved.
//

#import "SNBaseInternetQueryEngine.h"
#import "SNBaseQuery.h"

@implementation SNBaseInternetQueryEngine

- (AFHTTPSessionManager *)prepareSessionManager:(NSError **)error {
    RACInternetQuery *internetQuery = (RACInternetQuery *)self.query;
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
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
    SNBaseQuery *internetQuery = (SNBaseQuery *)self.query;
    NSDictionary *parameters = internetQuery.queryContent;
    parameters = parameters.count > 0 ? parameters : nil;
    
    NSString *method = @"";
    
    if ([self isKindOfClass:[SNPostInternetQueryEngine class]]) {
        method = @"POST";
    } else if ([self isKindOfClass:[SNGetInternetQueryEngine class]]) {
        method = @"GET";
    } else if ([self isKindOfClass:[SNDeleteInternetQueryEngine class]]) {
        method = @"DELETE";
    } else if ([self isKindOfClass:[SNPutInternetQueryEngine class]]) {
        method = @"PUT";
    } else if ([self isKindOfClass:[SNPatchInternetQueryEngine class]]) {
        method = @"PATCH";
    } else {
        NSLog(@"Unsupported Engine Type: %@", NSStringFromClass([self class]));
    }
    
    NSMutableURLRequest *request = [self.sessionManager.requestSerializer requestWithMethod:method URLString:internetQuery.serverUrl parameters:parameters error:nil];
    self.sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    if ([self.query isKindOfClass:[SNBaseQuery class]]) {
        if (((SNBaseQuery *)self.query).__token) {
            [request setValue:((SNBaseQuery *)self.query).__token forHTTPHeaderField:RequestTokenHeaderFieldKey];
        }
    }
    
    return request;
}

- (void)handleResponse:(NSURLResponse *)response responseObject:(NSDictionary *)responseObject error:(NSError *)error {
    if (error) {
        [self.notifier sendError:error];
        return;
    }
    
    [self.notifier sendSuccess:[responseObject dictionaryByRemovingNullValueKeys]];
}

@end
