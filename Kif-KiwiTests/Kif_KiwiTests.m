#import <kif-kiwi.h>

SPEC_BEGIN(MainViewAppSpec)

describe(@"main view", ^{
    
    it(@"should have tappable button", ^{
        [tester tapViewWithAccessibilityLabel:@"Tap Me!"];
        [tester waitForViewWithAccessibilityLabel:@"I'm Here"];
    });
    
});

SPEC_END