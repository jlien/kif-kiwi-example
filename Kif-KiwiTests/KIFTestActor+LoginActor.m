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

-(void) expectSuccessfulLogin
{
	[tester waitForViewWithAccessibilityLabel:@"Success"];
}

@end
