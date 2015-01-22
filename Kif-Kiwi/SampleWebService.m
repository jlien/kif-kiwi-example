//
//  SampleWebService.m
//  Kif-Kiwi
//
//  Created by Jim Lien on 1/22/15.
//  Copyright (c) 2015 midasmobile. All rights reserved.
//

#import "SampleWebService.h"
#import <RestKit/RestKit.h>

@interface SampleWebService ()

@end

@implementation SampleWebService

+ (void) get:(NSString *)path handler:(WebServiceResponseHandler) responseHandler {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://paleo-list.herokuapp.com/foods.json"]];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Peform the request
        NSURLResponse *response;
        NSError *error = nil;
        NSData *receivedData = [NSURLConnection sendSynchronousRequest:request
                                                     returningResponse:&response
                                                                 error:&error];
        NSLog(@"%@", response);
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                NSLog(@"Error %@", error);
                responseHandler(nil, error);
            } else if (httpResponse.statusCode > 299 ){
                NSError *error = [NSError errorWithDomain:@"HTTP ERROR" code:httpResponse.statusCode userInfo:@{NSLocalizedDescriptionKey: @"Server Error" }];
                responseHandler(nil, error);
            } else {
                responseHandler(receivedData, nil);
            }           
        });
        
    });
    
}

@end
