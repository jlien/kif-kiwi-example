//
//  Kif_KiwiTests.m
//  Kif-KiwiTests
//
//  Created by Jim Lien on 1/22/15.
//  Copyright (c) 2015 midasmobile. All rights reserved.
//

//#import <UIKit/UIKit.h>
//#import <XCTest/XCTest.h>
//
//@interface Kif_KiwiTests : XCTestCase
//
//@end
//
//@implementation Kif_KiwiTests
//
//- (void)setUp {
//    [super setUp];
//    // Put setup code here. This method is called before the invocation of each test method in the class.
//}
//
//- (void)tearDown {
//    // Put teardown code here. This method is called after the invocation of each test method in the class.
//    [super tearDown];
//}
//
//- (void)testExample {
//    // This is an example of a functional test case.
//    XCTAssert(YES, @"Pass");
//}
//
//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}
//
//@end

#import <KIF-Kiwi.h>

SPEC_BEGIN(MainViewAppSpec)

describe(@"Main view", ^{
    
    it(@"should have tappable button", ^{
        [tester tapViewWithAccessibilityLabel:@"Tap Me!"];
        [tester waitForViewWithAccessibilityLabel:@"I'm Here"];
    });
    
});

SPEC_END