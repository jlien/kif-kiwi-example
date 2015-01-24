//
//  KIFTestActor+LoginActor.m
//  Kif-Kiwi
//
//  Created by Jim Lien on 1/23/15.
//  Copyright (c) 2015 midasmobile. All rights reserved.
//

#import "KIFTestActor+LoginActor.h"
#import "LoginHelper.h"
#import <Kiwi/Kiwi.h>
#import "StubHelper.h"
#import <OHHTTPStubs.h>
#import <FDKeychain.h>

@implementation KIFTestActor (LoginActor)

-(void) logout
{
	[tester waitForTappableViewWithAccessibilityLabel:@"Logout"];
	[tester tapViewWithAccessibilityLabel:@"Logout"];
	[self clearLoginTextFields];
}

-(void) clearLoginTextFields
{
	[tester clearTextFromViewWithAccessibilityLabel:@"username"];
	[tester clearTextFromViewWithAccessibilityLabel:@"password"];
}

-(void) beforeLogin
{
	[tester enterText:@"login" intoViewWithAccessibilityLabel:@"username"];
	[tester enterText:@"password" intoViewWithAccessibilityLabel:@"password"];
}

-(void) validLogin
{
	[self beforeLogin];
	[self stubLoginWithValidCreds:YES];
}

-(void) expectSuccessfulLogin
{
	[tester waitForViewWithAccessibilityLabel:@"Success"];
}

-(void) expectFailedLogin
{
	[tester waitForViewWithAccessibilityLabel:@"Invalid Username / Password Combination"];
	[tester tapViewWithAccessibilityLabel:@"Invalid Username / Password Combination"];
}

-(void) stubLoginWithValidCreds:(BOOL)isValid
{
	
	NSDictionary *headers = @{@"Content-Type":@"application/json"};
	NSString *loginPath = @"http://api.example.com/api/login";
	NSNumber *statusCode = isValid ? @201 : @400;
	[StubHelper stubRequestForUrl:loginPath data:[self responseData] statusCode: statusCode headers:headers];
	[tester tapViewWithAccessibilityLabel:@"Login"];
}

-(NSDictionary *) responseData
{
	return @{ @"token": @"1234" };
};

@end
