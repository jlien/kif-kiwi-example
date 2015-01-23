//
//  Authenticator.m
//  Kif-Kiwi
//
//  Created by Jim Lien on 1/23/15.
//  Copyright (c) 2015 midasmobile. All rights reserved.
//

#import "Authenticator.h"
#import <FDKeychain/FDKeychain.h>

@implementation Authenticator

+(void) authenticateWithUsername:(NSString *)username password:(NSString *)password handler:(WebServiceResponseHandler)handler
{
    [SampleWebService get:@"api/login" handler:^(id obj, NSError *error) {
        if (error){
            handler(nil, error);
        } else {
            // Save the user in the keychain
            NSDictionary *sessionData = (NSDictionary *) obj;
            [FDKeychain saveItem:sessionData forKey:@"token" forService:@"session" error:&error];
            handler(sessionData, nil);
        }
    }];
}

@end
