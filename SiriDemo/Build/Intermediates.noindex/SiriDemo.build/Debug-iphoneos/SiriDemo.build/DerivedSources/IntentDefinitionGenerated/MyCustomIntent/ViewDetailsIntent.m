//
// ViewDetailsIntent.m
//
// This file was automatically generated and should not be edited.
//

#import "ViewDetailsIntent.h"

@implementation ViewDetailsIntent

@dynamic userName, age;

@end

@interface ViewDetailsIntentResponse ()

@property (readwrite, NS_NONATOMIC_IOSONLY) ViewDetailsIntentResponseCode code;

@end

@implementation ViewDetailsIntentResponse

@synthesize code = _code;

@dynamic name, age;

- (instancetype)initWithCode:(ViewDetailsIntentResponseCode)code userActivity:(nullable NSUserActivity *)userActivity {
    self = [super init];
    if (self) {
        _code = code;
        self.userActivity = userActivity;
    }
    return self;
}

+ (instancetype)successIntentResponseWithName:(NSString *)name age:(NSString *)age {
    ViewDetailsIntentResponse *intentResponse = [[ViewDetailsIntentResponse alloc] initWithCode:ViewDetailsIntentResponseCodeSuccess userActivity:nil];
    intentResponse.name = name;
    intentResponse.age = age;
    return intentResponse;
}

@end
