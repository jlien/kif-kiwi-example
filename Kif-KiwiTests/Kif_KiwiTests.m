#import <kif-kiwi.h>
#import <OHHTTPStubs.h>

SPEC_BEGIN(LoginViewSpec)
beforeAll(^{
});
afterAll(^{
});
afterEach(^{
});
describe(@"Login View", ^{
    
    context(@"when logging in", ^{
        let(loginPath, ^id{ return @"http://api.example.com/api/login";});
        beforeEach(^{
            [tester enterText:@"validLogin" intoViewWithAccessibilityLabel:@"username"];
        });

        context(@"with valid creds", ^{
            beforeEach(^{
                [tester enterText:@"validPassword" intoViewWithAccessibilityLabel:@"password"];
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return YES;
                } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithData:nil statusCode:201 headers:@{@"Content-Type":@"application/json"}];
                }];
                [tester tapViewWithAccessibilityLabel:@"Login"];
            });
            afterEach(^{
                [tester waitForViewWithAccessibilityLabel:@"Dismiss"];
                [tester tapViewWithAccessibilityLabel:@"Dismiss"];
                [tester clearTextFromViewWithAccessibilityLabel:@"username"];
                [tester clearTextFromViewWithAccessibilityLabel:@"password"];
            });
            it(@"directs the user to the success view", ^{
                [tester waitForViewWithAccessibilityLabel:@"Success"];
            });
        });
        context(@"with invalid creds", ^{
            beforeEach(^{
                [tester enterText:@"invalidPassword" intoViewWithAccessibilityLabel:@"password"];
                    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return YES;
                } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithData:nil statusCode:401 headers:@{@"Content-Type":@"application/json"}];
                }];
                [tester tapViewWithAccessibilityLabel:@"Login"];
            });
            
            afterEach(^{
                [tester clearTextFromViewWithAccessibilityLabel:@"username"];
                [tester clearTextFromViewWithAccessibilityLabel:@"password"];
            });
            it(@"displays an error", ^{
                [tester waitForViewWithAccessibilityLabel:@"Error"];
            });
        });
    });
    
});

SPEC_END