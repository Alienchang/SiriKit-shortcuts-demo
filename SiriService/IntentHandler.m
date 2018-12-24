//
//  IntentHandler.m
//  SiriService
//
//  Created by Chang Liu on 12/24/18.
//  Copyright © 2018 iSing. All rights reserved.
//

#import "IntentHandler.h"
#import "SendMessageIntentHandler.h"
#import "SendPaymentIntentHandler.h"
#import "EnterRoomIntentHandler.h"
#import "EnterRoomIntent.h"
@interface IntentHandler ()

@end

@implementation IntentHandler

- (id)handlerForIntent:(INIntent *)intent {
    if ([intent isKindOfClass:[INSendMessageIntent class]]) {
        return [SendMessageIntentHandler new];
    } else if ([intent isKindOfClass:[INSendPaymentIntent class]]) {
        return [SendPaymentIntentHandler new];
    } else if ([intent isKindOfClass:[EnterRoomIntent class]]) {
        return [EnterRoomIntentHandler new];
    }
    
    return nil;
}

@end
