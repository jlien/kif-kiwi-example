## BDD Sample Login using KIF, Kiwi, OHHTPStubs and OCMock

I've worked on only a few iOS projects where testing was a highly integral part of the development process. However, nearly every other software project, testing is effectively a requirement. With Rails projects, my company [Arcweb](http://arcweb.co) focuses on BDD with RSpec and Capybara. The goal of this sample project is to emulate BDD practices from Rails development and apply them to iOS Development.

## KIF

[KIF](https://github.com/kif-framework/KIF) provides an integration testing framework for iOS that uses accessibility labels on UI elements to handle touch events. [Calabash](https://github.com/calabash/calabash-ios) is a similar framework that uses Cucumber syntax. It takes a little more configuration to get up and running so I stuck with KIF.

## Kiwi

[Kiwi](https://github.com/kiwi-bdd/Kiwi) provides an RSpec like DSL for Objective-C. As an example, an RSpec/Capybara test might look like this:

``` ruby
describe('Login Pages') do
  context 'when the user signs in' do
    before(:each) { fill_in_login_for user }

    context 'with a valid password' do
      before(:each) { submit_login }
      it 'logs the user in' do 
        displays_home_page
      end
    end

    context 'with an invalid password' do
      before(:each) { enter_invalid_password }
      it 'returns the user to the login page' do
        expect(page).to have_content('Invalid email or password')
      end
    end
  end
end
```

The same specs with Kiwi and KIF would be:

``` Obj-c
SPEC_BEGIN(LoginViewSpec)

describe(@"Login View", ^{
  context(@"when logging in", ^{
    beforeEach(^{ [tester beforeLogin]; });
    context(@"with valid creds", ^{
      beforeEach(^{ [tester stubLoginWithValidCreds:YES]; });
      afterEach(^{ [tester logout]; });
      it(@"directs the user to the success view", ^{ [tester expectSuccessfulLogin]; });
    });
		
    context(@"with invalid creds", ^{
      beforeEach(^{ [tester stubLoginWithValidCreds:NO]; });
      afterEach(^{ [tester clearLoginTextFields]; });
      it(@"displays an error", ^{ [tester expectFailedLogin]; });
    });
  });
});

SPEC_END
``` 

### Helpers

In RSpec, in order to refactor lengthy specs, you might use a helper.

``` ruby

module LoginPagesHelper

  def fill_in_login_for user
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: 'a_valid_password'
  end

  def submit_password
    click_button 'Log In'
  end

  def displays_login_page
    expect(page).to have_content('Log In')
  end

end

```

Similar refactoring can be done to a KIF/Kiwi spec by creating a category that extends ```KIFUITestActor```.

``` Obj-C
-(void) validLogin
{
  [self beforeLogin];
  [self stubLoginWithValidCreds:YES];
}

-(void) expectSuccessfulLogin
{
  [tester waitForViewWithAccessibilityLabel:@"Success"];
}

-(void) expectFailedLogin
{
  [tester waitForViewWithAccessibilityLabel:@"Invalid Username / Password Combination"];
  [tester tapViewWithAccessibilityLabel:@"Invalid Username / Password Combination"];
}

```

The ```KIFUITestActor``` can also be used to perform setup or teardown code.

## OHHTPStubs

One of the more important elements of iOS testing is to ensure an app handles web service calls correctly. These calls may be difficult to simulate when working with a live staging server. OHHTPStubs provides a nice framework to stub any network call while running tests. [Nocilla](https://github.com/luisobo/Nocilla) is a similar framework that is actually syntactically similar to ```Klass.any_instance.stub(:method).and_return(some_data)``` that is used in Rails. I found it to be less reliable for whatever reason and chose to continue with OHHTTPStubs.

In my example I created a Stub Helper to remove some of the unnecessary block syntax for our purposes.

``` Obj-c
+(void) stubRequestForUrl:(NSString *)path data:(NSDictionary *)responseData statusCode:(NSNumber *) statusCode headers:(NSDictionary *)headers;
{
  [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
    return YES;
  } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
    return [OHHTTPStubsResponse responseWithJSONObject:responseData statusCode:[statusCode integerValue] headers:headers];
  }];
}
```

This makes my stubbing method a one-liner:

``` Obj-c
  [StubHelper stubRequestForUrl:loginPath data:[self responseData] statusCode: statusCode headers:headers];
```

