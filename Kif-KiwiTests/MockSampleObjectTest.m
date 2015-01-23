//
//  MockSampleObjectTest.m
//  Kif-Kiwi
//
//  Created by Jim Lien on 1/23/15.
//  Copyright (c) 2015 midasmobile. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <OCMock/OCMock.h>
#import "SampleObject.h"

SPEC_BEGIN(MockSampleObjectSpec)

describe(@"Mock Sample Object", ^{
    context(@"#someData", ^{
        it(@"returns a dictionary", ^{
            // [SampleObject someMethod] statically returns @{ @"key": @"value }
            // We will mock the method to return a slightly different dictionary
            
            SampleObject *obj = [[SampleObject alloc] init];
            id sampleObjectMock = OCMPartialMock(obj);
            OCMStub([sampleObjectMock someData]).andReturn(@{ @"key": @"newValue" });
            [[[obj someData] should] equal:@{ @"key": @"newValue"}];
        });
    });
});


SPEC_END