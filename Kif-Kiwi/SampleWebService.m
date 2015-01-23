//
//  SampleWebService.m
//  Kif-Kiwi
//
//  Created by Jim Lien on 1/22/15.
//  Copyright (c) 2015 midasmobile. All rights reserved.
//

#import "SampleWebService.h"
#import <AFNetworking/AFNetworking.h>

@interface SampleWebService ()

@end

@implementation SampleWebService

+ (void) get:(NSString *)path handler:(WebServiceResponseHandler) responseHandler {
    NSString *urlString = [NSString stringWithFormat:@"http://api.example.com/%@", path];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *responseDic = (NSDictionary *) responseObject;
        responseHandler(responseDic, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        responseHandler(nil, error);
    }];
    
////    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        // Peform the request
//        NSURLResponse *response;
//        NSError *error = nil;
//        NSData *receivedData = [NSURLConnection sendSynchronousRequest:request
//                                                     returningResponse:&response
//                                                                 error:&error];
//        NSLog(@"Web Service Response: %@", response);
//        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
//        
////        dispatch_async(dispatch_get_main_queue(), ^{
//            if (error) {
//                NSLog(@"Error %@", error);
//                responseHandler(nil, error);
//            } else if (httpResponse.statusCode > 299 ){
//                NSError *error = [NSError errorWithDomain:@"HTTP ERROR" code:httpResponse.statusCode userInfo:@{NSLocalizedDescriptionKey: @"Server Error" }];
//                responseHandler(nil, error);
//            } else {
//                responseHandler(receivedData, nil);
//            }           
//        });
//        
//    });
    
}

@end
