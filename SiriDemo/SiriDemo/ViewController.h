//
//  ViewController.h
//  SiriDemo
//
//  Created by Ritheesh on 18/06/19.
//  Copyright © 2019 Ritheesh. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <Intents/Intents.h>
#import <IntentsUI/IntentsUI.h>
#import <IntentDefinitionGenerated/MyCustomIntent/ViewDetailsIntent.h>

@interface ViewController : UIViewController<INUIAddVoiceShortcutButtonDelegate, INUIEditVoiceShortcutViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameFiledText;

@property (weak, nonatomic) IBOutlet UITextField *ageFiledText;
@property (weak, nonatomic) IBOutlet UIView *siriButtonView;

@property (weak, nonatomic) IBOutlet UIView *editButtonView;
@property (nonatomic) INUIAddVoiceShortcutButton *siriAddButton;
@property (nonatomic) INUIEditVoiceShortcutViewController *editSiri;
@end

