//
//  ViewController.m
//  TestSiri
//
//  Created by Chang Liu on 12/21/18.
//  Copyright © 2018 iSing. All rights reserved.
//

#import "ViewController.h"
#import "SiriTool.h"
#import <IntentsUI/IntentsUI.h>
#import <Intents/Intents.h>
#import "EnterRoomIntent.h"

@interface ViewController ()<INUIAddVoiceShortcutViewControllerDelegate>
@property (nonatomic ,strong) UILabel *messageLabel;
@property (nonatomic ,strong) UILabel *amountLabel;
@property (nonatomic ,strong) UILabel *nameLabel;
@end

static ViewController *controller = nil;
@implementation ViewController
+ (instancetype)shareController {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        controller = [[self alloc] init];
    });
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.messageLabel];
    UILabel *messageTitleLabel = [UILabel new];
    [self.view addSubview:messageTitleLabel];
    [messageTitleLabel setFrame:CGRectMake(20, 40, 70, 20)];
    [messageTitleLabel setText:@"message"];
    [self.messageLabel setFrame:CGRectMake(90, 40, 200, 20)];
    
    [self.messageLabel setText:[SiriTool message]];

    UILabel *moneyTitleLabel = [UILabel new];
    [moneyTitleLabel setText:@"amount"];
    [moneyTitleLabel setFrame:CGRectMake(20, 200, 70, 20)];
    [self.view addSubview:moneyTitleLabel];
    [self.amountLabel setText:[NSString stringWithFormat:@"%ld",[SiriTool amount]]];
    [self.amountLabel setFrame:CGRectMake(90, 200, 200, 20)];
    [self.view addSubview:self.amountLabel];
    
    if (@available(iOS 12.0, *)) {
        INUIAddVoiceShortcutButton *siriButton = [[INUIAddVoiceShortcutButton alloc] initWithStyle:INUIAddVoiceShortcutButtonStyleBlack];
        [siriButton setFrame:CGRectMake(50, 250, 130, 40)];
        [self.view addSubview:siriButton];
        [siriButton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    } else {
        
    }
    
    [self.view addSubview:self.nameLabel];
    [self.nameLabel setFrame:CGRectMake(50, 320, 130, 20)];
    [self.nameLabel setText:[SiriTool roomName]];
}

- (void)buttonAction {
    if (@available(iOS 12.0, *)) {
        EnterRoomIntent *intent = [EnterRoomIntent new];
        [intent setName:@[@"小明",@"小二"]];
        INShortcut *shortcut = [[INShortcut alloc] initWithIntent:intent];
        INUIAddVoiceShortcutViewController *viewController = [[INUIAddVoiceShortcutViewController alloc] initWithShortcut:shortcut];
        [viewController setModalPresentationStyle:UIModalPresentationFormSheet];
        [viewController setDelegate:self];
        [self presentViewController:viewController animated:YES completion:nil];
    } else {
        // Fallback on earlier versions
    }
}

- (void)pay:(NSInteger)money {
    
}
- (void)charge:(NSInteger)money {
    
}
#pragma mark -- getter
- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [UILabel new];
        [_messageLabel setTextColor:[UIColor blackColor]];
    }
    return _messageLabel;
}
- (UILabel *)amountLabel {
    if (!_amountLabel) {
        _amountLabel = [UILabel new];
        [_amountLabel setTextColor:[UIColor blackColor]];
    }
    return _amountLabel;
}
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        [_nameLabel setTextColor:[UIColor blackColor]];
    }
    return _nameLabel;
}

- (void)addVoiceShortcutViewController:(INUIAddVoiceShortcutViewController *)controller didFinishWithVoiceShortcut:(nullable INVoiceShortcut *)voiceShortcut error:(nullable NSError *)error {
    [controller dismissViewControllerAnimated:YES completion:nil];
}
- (void)addVoiceShortcutViewControllerDidCancel:(INUIAddVoiceShortcutViewController *)controller {
    [controller dismissViewControllerAnimated:YES completion:nil];
}
@end
