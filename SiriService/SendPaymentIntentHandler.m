//
//  SendPaymentIntentHandler.m
//  SiriService
//
//  Created by Chang Liu on 12/24/18.
//  Copyright © 2018 iSing. All rights reserved.
//

#import "SendPaymentIntentHandler.h"
#import "SiriTool.h"
@interface SendPaymentIntentHandler()<INSendPaymentIntentHandling>

@end
@implementation SendPaymentIntentHandler
// 解析货币单位方法
- (void)resolveCurrencyAmountForSendPayment:(INSendPaymentIntent *)intent completion:(void (^)(INSendPaymentCurrencyAmountResolutionResult * _Nonnull))completion {
    INCurrencyAmount *amount = intent.currencyAmount;
    //amount.currencyCode = @"CNH";
    if (amount == nil) {
        completion([INSendPaymentCurrencyAmountResolutionResult needsValue]);
        return;
    }
    completion([INSendPaymentCurrencyAmountResolutionResult successWithResolvedCurrencyAmount:amount]);
}


// 解析附加语方法
- (void)resolveNoteForSendPayment:(INSendPaymentIntent *)intent withCompletion:(void (^)(INStringResolutionResult * resolutionResult))completion {
    NSString *text = intent.note;
    if (text && ![text isEqualToString:@""]) {
        completion([INStringResolutionResult successWithResolvedString:text]);
    } else {
        completion([INStringResolutionResult needsValue]);
    }
}

// 确认方法
- (void)confirmSendPayment:(INSendPaymentIntent *)intent completion:(void (^)(INSendPaymentIntentResponse * response))completion {
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:NSStringFromClass([INSendPaymentIntent class])];
    INSendPaymentIntentResponse *response = [[INSendPaymentIntentResponse alloc] initWithCode:INSendPaymentIntentResponseCodeReady userActivity:userActivity];
    response.paymentRecord = [[INPaymentRecord alloc] initWithPayee:intent.payee payer:nil currencyAmount:intent.currencyAmount paymentMethod:nil note:intent.note status:INPaymentStatusPending];
    completion(response);
}

- (void)handleSendPayment:(nonnull INSendPaymentIntent *)intent completion:(nonnull void (^)(INSendPaymentIntentResponse * _Nonnull))completion {
    [SiriTool payMoney:intent.currencyAmount.amount.integerValue];
    completion([[INSendPaymentIntentResponse alloc] initWithCode:INSendPaymentIntentResponseCodeSuccess userActivity:nil]);
}

@end
