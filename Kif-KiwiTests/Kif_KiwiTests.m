#import <kif-kiwi.h>
#import <OHHTTPStubs.h>
#import <FDKeychain.h>
#import "StubHelper.h"
#import "LoginHelper.h"
#import "KIFTestActor+LoginActor.h"

SPEC_BEGIN(LoginViewSpec)

describe(@"Login View", ^{
	context(@"when logging in", ^{
		let(loginPath, ^id{ return @"http://api.example.com/api/login";});
		let(headers, ^id { return @{@"Content-Type":@"application/json"}; });
		let(responseData, ^id{ return @{ @"token": @"1234" }; });
		beforeEach(^{	[tester beforeLogin]; });
		
		context(@"with valid creds", ^{
			beforeEach(^{
				[StubHelper stubRequestForUrl:loginPath data:responseData statusCode: @201 headers:headers];
				[tester tapViewWithAccessibilityLabel:@"Login"];
			});
			afterEach(^{ [tester logout]; });
			it(@"directs the user to the success view", ^{
				[tester expectSuccessfulLogin];
				[[[LoginHelper keychainValue] should] equal:responseData];
			});
		});
		
		context(@"with invalid creds", ^{
			beforeEach(^{
				[StubHelper stubRequestForUrl:loginPath data: @{} statusCode:@401 headers:headers];
				[tester tapViewWithAccessibilityLabel:@"Login"];
			});
			afterEach(^{
				[tester clearLoginTextFields];
			});
			it(@"displays an error", ^{
				[tester waitForViewWithAccessibilityLabel:@"Invalid Username / Password Combination"];
				[tester tapViewWithAccessibilityLabel:@"Invalid Username / Password Combination"];
			});
		});
	});
});

SPEC_END