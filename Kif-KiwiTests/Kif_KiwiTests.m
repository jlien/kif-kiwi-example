#import <kif-kiwi.h>

//SPEC_BEGIN(LoginViewSpec)
//beforeAll(^{
//    [[LSNocilla sharedInstance] start];
//});
//afterAll(^{
//    [[LSNocilla sharedInstance] stop];
//});
//afterEach(^{
//    [[LSNocilla sharedInstance] clearStubs];
//});
//describe(@"Login View", ^{
//    
//    context(@"when logging in", ^{
//        NSString *loginPath = @"http://api.example.com/api/login";
//        beforeEach(^{
//            [tester enterText:@"validLogin" intoViewWithAccessibilityLabel:@"username"];
//        });
//        afterEach(^{
//            [tester clearTextFromViewWithAccessibilityLabel:@"username"];
//            [tester clearTextFromViewWithAccessibilityLabel:@"password"];
//        });
//        context(@"with valid creds", ^{
//            beforeEach(^{
//                [tester enterText:@"validPassword" intoViewWithAccessibilityLabel:@"password"];
//                stubRequest(@"POST", loginPath).andReturn(200);
//                [tester tapViewWithAccessibilityLabel:@"Login"];
//            });
//            it(@"directs the user to the success view", ^{
//                [tester waitForViewWithAccessibilityLabel:@"Success" value:@"Success" traits:UIAccessibilityTraitStaticText];
////                [tester waitForViewWithAccessibilityLabel:@"Success"];
//            });
//        });
//        context(@"with invalid creds", ^{
//            beforeEach(^{
//                [tester enterText:@"invalidPassword" intoViewWithAccessibilityLabel:@"password"];
//                stubRequest(@"POST", loginPath).andReturn(401);
//                [tester tapViewWithAccessibilityLabel:@"Login"];
//            });
//            it(@"displays an error", ^{
//                [tester waitForViewWithAccessibilityLabel:@"Error"];
//            });
//        });
//    });
//    
//});
//
//SPEC_END