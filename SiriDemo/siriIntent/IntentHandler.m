//
//  IntentHandler.m
//  siriIntent
//
//  Created by Ritheesh on 18/06/19.
//  Copyright © 2019 Ritheesh. All rights reserved.
//

#import "IntentHandler.h"


@interface IntentHandler ()

@end

@implementation IntentHandler

- (id)handlerForIntent:(ViewDetailsIntent *)intent {
    // This is the default implementation.  If you want different objects to handle different intents,
    // you can override this and return the handler you want for that particular intent.
    
    return self;
}

- (void)handleViewDetails:(ViewDetailsIntent *)intent completion:(void (^)(ViewDetailsIntentResponse * _Nonnull))completion
{
    
    ViewDetailsIntentResponse* response = [[ViewDetailsIntentResponse alloc] initWithCode:ViewDetailsIntentResponseCodeSuccess userActivity:nil];
    response.age = intent.age;
    response.name = intent.userName;
    completion(response);
    NSLog(@"rec details are %@",intent);
    
}

- (void)confirmViewDetails:(ViewDetailsIntent *)intent completion:(void (^)(ViewDetailsIntentResponse * _Nonnull))completion{
    
    ViewDetailsIntentResponse* response = [[ViewDetailsIntentResponse alloc] initWithCode:ViewDetailsIntentResponseCodeSuccess userActivity:nil];
    NSLog(@"response %@ intent %@",response,intent);
    
    completion(response);
}


@end
