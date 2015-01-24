//
//  StubHelper.m
//  Kif-Kiwi
//
//  Created by Jim Lien on 1/23/15.
//  Copyright (c) 2015 midasmobile. All rights reserved.
//

#import "StubHelper.h"
#import <OHHTTPStubs/OHHTTPStubs.h>

@implementation StubHelper

+(void) stubRequestForUrl:(NSString *)path data:(NSDictionary *)responseData statusCode:(NSNumber *) statusCode headers:(NSDictionary *)headers;
{
	[OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
		return YES;
	} withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
		return [OHHTTPStubsResponse responseWithJSONObject:responseData statusCode:[statusCode integerValue] headers:headers];
	}];
}

@end
