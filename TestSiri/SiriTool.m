//
//  SiriTool.m
//  TestSiri
//
//  Created by Chang Liu on 12/24/18.
//  Copyright © 2018 iSing. All rights reserved.
//

#import "SiriTool.h"

@implementation SiriTool
+ (void)sendMessage:(NSString *)message {
    NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.siriSerivice.extension"];
    [userDefault setValue:message forKey:@"message"];
    [userDefault synchronize];
}
+ (void)payMoney:(NSInteger)amount {
    NSInteger currentAmount = [self amount];
    currentAmount -= amount;
    NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.siriSerivice.extension"];
    [userDefault setInteger:currentAmount forKey:@"amount"];
    [userDefault synchronize];
}
+ (void)chargeMoney:(NSInteger)amount {
    
}

+ (NSString *)message {
    NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.siriSerivice.extension"];
    NSString *message = [userDefault stringForKey:@"message"];
    return message;
}
+ (NSInteger)amount {
    NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.siriSerivice.extension"];
    NSInteger amout = [userDefault integerForKey:@"amount"];
    if (amout <= 0) {
        [userDefault setInteger:1000 forKey:@"amount"];
        [userDefault synchronize];
        amout = [userDefault integerForKey:@"amount"];
    }
    return amout;
}

+ (NSString *)roomName {
    NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.siriSerivice.extension"];
    NSString *name = [userDefault stringForKey:@"name"];
    return name;
}
+ (void)setRoomName:(NSString *)name {
    NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:@"group.siriSerivice.extension"];
    [userDefault setObject:name forKey:@"name"];
    [userDefault synchronize];
}
@end
