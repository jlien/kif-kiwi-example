#import <kif-kiwi.h>
#import <OHHTTPStubs.h>
#import <FDKeychain.h>

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
            let(responseData, ^id{
                return @{ @"token": @"1234" };
            });
            beforeEach(^{
                [tester enterText:@"validPassword" intoViewWithAccessibilityLabel:@"password"];
                [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                    return YES;
                } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
                    return [OHHTTPStubsResponse responseWithJSONObject:responseData statusCode:201 headers:@{@"Content-Type":@"application/json"}];
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
                NSError *error;
                NSDictionary *dic = [FDKeychain itemForKey:@"token" forService:@"session" error:&error];
                [[dic should] equal:@{ @"token": @"1234"} ];
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
                [tester waitForViewWithAccessibilityLabel:@"Invalid Username / Password Combination"];
                [tester tapViewWithAccessibilityLabel:@"Invalid Username / Password Combination"];
            });
        });
    });
    
});

SPEC_END