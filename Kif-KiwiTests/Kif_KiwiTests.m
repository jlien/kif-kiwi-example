#import <kif-kiwi.h>

SPEC_BEGIN(MainViewAppSpec)

describe(@"Main View", ^{
    
    it(@"should have tappable button", ^{
        [tester tapViewWithAccessibilityLabel:@"Tap Me!"];
        [tester waitForViewWithAccessibilityLabel:@"I'm Here"];
    });
    
});

SPEC_END