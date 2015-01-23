//
//  KifStubbedTests.m
//  Kif-Kiwi
//
//  Created by Jim Lien on 1/23/15.
//  Copyright (c) 2015 midasmobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <KIF/KIF.h>
#import <OHHTTPStubs/OHHTTPStubs.h>
@interface KifStubbedTests : KIFTestCase

@end

@implementation KifStubbedTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void) beforeTestLogin:(BOOL) isValid {
//    NSString *loginPath = @"http://api.example.com/api/login";
    NSInteger statusCode = isValid ? 200 : 404;
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        return YES;
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        return [OHHTTPStubsResponse responseWithData:nil statusCode:statusCode headers:@{@"Content-Type":@"application/json"}];
    }];
    [tester enterText:@"validLogin" intoViewWithAccessibilityLabel:@"username"];
    [tester enterText:@"validPassword" intoViewWithAccessibilityLabel:@"password"];
    [tester tapViewWithAccessibilityLabel:@"Login"];
}

- (void) testLogin {
    [self beforeTestLogin: YES];
    [tester waitForViewWithAccessibilityLabel:@"Success" value:nil traits:UIAccessibilityTraitStaticText];
    [tester tapViewWithAccessibilityLabel:@"Dismiss"];
}

- (void) testInvalidLogin {
    [self beforeTestLogin:NO];
    [self afterTestInvalidLogin];
}

- (void) afterTestInvalidLogin {
    [tester clearTextFromViewWithAccessibilityLabel:@"username"];
    [tester clearTextFromViewWithAccessibilityLabel:@"password"];
}

@end
