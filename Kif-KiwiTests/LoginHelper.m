//
//  LoginHelper.m
//  Kif-Kiwi
//
//  Created by Jim Lien on 1/23/15.
//  Copyright (c) 2015 midasmobile. All rights reserved.
//

#import "LoginHelper.h"
#import <FDKeychain/FDKeychain.h>

@implementation LoginHelper

+(NSDictionary *) keychainValue
{
    NSError *error;
    NSDictionary *dic = [FDKeychain itemForKey:@"token" forService:@"session" error:&error];
    return dic;
}

@end
