//
//  EnterRoomIntentHandler.m
//  SiriService
//
//  Created by Chang Liu on 12/24/18.
//  Copyright © 2018 iSing. All rights reserved.
//

#import "EnterRoomIntentHandler.h"
#import "EnterRoomIntent.h"
#import "SiriTool.h"
@interface EnterRoomIntentHandler()<EnterRoomIntentHandling>
@end
@implementation EnterRoomIntentHandler
- (void)handleEnterRoom:(EnterRoomIntent *)intent completion:(void (^)(EnterRoomIntentResponse *response))completion NS_SWIFT_NAME(handle(intent:completion:)) {
    [SiriTool setRoomName:intent.name[0]];
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([EnterRoomIntent class])];
    EnterRoomIntentResponse *response = [[EnterRoomIntentResponse alloc] initWithCode:EnterRoomIntentResponseCodeSuccess userActivity:userActivity];
    completion(response);
}
@end
