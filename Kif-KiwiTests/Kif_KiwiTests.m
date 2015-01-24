#import <kif-kiwi.h>
#import "KIFTestActor+LoginActor.h"

SPEC_BEGIN(LoginViewSpec)

describe(@"Login View", ^{
	context(@"when logging in", ^{
		beforeEach(^{	[tester beforeLogin]; });

		context(@"with valid creds", ^{
			beforeEach(^{ [tester stubLoginWithValidCreds:YES]; });
			afterEach(^{ [tester logout]; });
			it(@"directs the user to the success view", ^{ [tester expectSuccessfulLogin]; });
		});
		
		context(@"with invalid creds", ^{
			beforeEach(^{ [tester stubLoginWithValidCreds:NO]; });
			afterEach(^{ [tester clearLoginTextFields]; });
			it(@"displays an error", ^{ [tester expectFailedLogin]; });
		});
	});
});

SPEC_END