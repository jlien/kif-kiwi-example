//
//  StubHelper.h
//  Kif-Kiwi
//
//  Created by Jim Lien on 1/23/15.
//  Copyright (c) 2015 midasmobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StubHelper : NSObject

+(void) stubRequestForUrl:(NSString *)path data:(NSDictionary *)responseData statusCode:(NSNumber *) statusCode headers:(NSDictionary *)headers;

@end
