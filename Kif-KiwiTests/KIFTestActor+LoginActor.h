//
//  KIFTestActor+LoginActor.h
//  Kif-Kiwi
//
//  Created by Jim Lien on 1/23/15.
//  Copyright (c) 2015 midasmobile. All rights reserved.
//
#import <KIF/KIF.h>
#import "KIFTestActor.h"

@interface KIFTestActor (LoginActor)

-(void) beforeLogin;
-(void) logout;
-(void) clearLoginTextFields;
-(void) expectSuccessfulLogin;
-(void) expectFailedLogin;
-(void) stubLoginWithValidCreds:(BOOL) isValid;

@end
