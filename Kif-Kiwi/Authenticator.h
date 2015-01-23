//
//  Authenticator.h
//  Kif-Kiwi
//
//  Created by Jim Lien on 1/23/15.
//  Copyright (c) 2015 midasmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SampleWebService.h"

@interface Authenticator : NSObject

+(void) authenticateWithUsername:(NSString *) username password:(NSString *) password handler: (WebServiceResponseHandler) handler;

@end
