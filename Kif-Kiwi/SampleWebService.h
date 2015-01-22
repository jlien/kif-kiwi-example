//
//  SampleWebService.h
//  Kif-Kiwi
//
//  Created by Jim Lien on 1/22/15.
//  Copyright (c) 2015 midasmobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SampleWebService : NSObject

typedef void (^WebServiceResponseHandler)(id obj, NSError *error);

+ (void) get:(NSString *)path handler:(WebServiceResponseHandler)handler;

@end
