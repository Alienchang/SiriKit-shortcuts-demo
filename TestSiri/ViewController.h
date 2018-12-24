//
//  ViewController.h
//  TestSiri
//
//  Created by Chang Liu on 12/21/18.
//  Copyright © 2018 iSing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
+ (instancetype)shareController;
- (void)sendMessage:(NSString *)message;
- (void)pay:(NSInteger)money;
- (void)charge:(NSInteger)money;
@end

