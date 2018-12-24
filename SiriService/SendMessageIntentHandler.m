//
//  SendMessageIntentHandler.m
//  SiriService
//
//  Created by Chang Liu on 12/24/18.
//  Copyright © 2018 iSing. All rights reserved.
//

#import "SendMessageIntentHandler.h"
#import "ViewController.h"
#import "SiriTool.h"
#import <Intents/Intents.h>
@interface SendMessageIntentHandler()<INSendMessageIntentHandling>

@end
@implementation SendMessageIntentHandler
// 用于解析处理接收到的数据
- (void)resolveRecipientsForSendMessage:(INSendMessageIntent *)intent completion:(void (^)(NSArray<INSendMessageRecipientResolutionResult *> * _Nonnull))completion {
    NSArray<INPerson *> *recipients = intent.recipients;

    if (recipients.count == 0) {
        completion(@[[INSendMessageRecipientResolutionResult needsValue]]);
        return;
    }
    NSMutableArray<INSendMessageRecipientResolutionResult *> *resolutionResults = [NSMutableArray array];
    for (INPerson *recipient in recipients) {
        NSString *recipientName = recipient.displayName;
        if ([recipientName isEqualToString:@"小明"]) {
            [resolutionResults addObject:[INSendMessageRecipientResolutionResult successWithResolvedPerson:recipient]];
            completion(resolutionResults);
            return;
        }
    }
    
    [resolutionResults addObject:[INSendMessageRecipientResolutionResult unsupported]];
    completion(resolutionResults);
}
// 用于确认动作
- (void)confirmSendMessage:(INSendMessageIntent *)intent completion:(void (^)(INSendMessageIntentResponse * _Nonnull))completion {
    [SiriTool sendMessage:intent.content];
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INSendMessageIntent class])];
    INSendMessageIntentResponse *response = [[INSendMessageIntentResponse alloc] initWithCode:INSendMessageIntentResponseCodeReady userActivity:userActivity];
    completion(response);
}
// 发送或者取消发送回执
- (void)handleSendMessage:(INSendMessageIntent *)intent completion:(void (^)(INSendMessageIntentResponse * _Nonnull))completion {
    
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INSendMessageIntent class])];
    INSendMessageIntentResponse *response = [[INSendMessageIntentResponse alloc] initWithCode:INSendMessageIntentResponseCodeSuccess userActivity:userActivity];
    completion(response);
}
@end
