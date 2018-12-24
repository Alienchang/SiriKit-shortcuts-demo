//
//  SiriTool.h
//  TestSiri
//
//  Created by Chang Liu on 12/24/18.
//  Copyright © 2018 iSing. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SiriTool : NSObject
+ (void)sendMessage:(NSString *)message;
+ (void)payMoney:(NSInteger)amount;
+ (void)chargeMoney:(NSInteger)amount;

+ (NSString *)message;
+ (NSInteger)amount;

+ (NSString *)roomName;
+ (void)setRoomName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
