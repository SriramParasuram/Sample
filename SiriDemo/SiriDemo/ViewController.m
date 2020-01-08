//
//  ViewController.m
//  SiriDemo
//
//  Created by Ritheesh on 18/06/19.
//  Copyright © 2019 Ritheesh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) ViewDetailsIntent *myDonatedIntent;
@property (nonatomic)INVoiceShortcut *donatedShortCut;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.siriAddButton = [[INUIAddVoiceShortcutButton alloc] initWithStyle:INUIAddVoiceShortcutButtonStyleWhiteOutline];
    self.siriAddButton.frame = CGRectMake(0, 0, self.siriButtonView.frame.size.width, self.siriButtonView.frame.size.height);
    [self.siriButtonView addSubview:self.siriAddButton];
    [self.siriAddButton addTarget:self action:@selector(showSiri) forControlEvents:UIControlEventTouchUpInside];

    UIButton *editButton =[UIButton buttonWithType:UIButtonTypeCustom];
    editButton.frame = CGRectMake(0, 0, self.editButtonView.frame.size.width, self.editButtonView.frame.size.height);
    [editButton setTitle:@"Edit Siri" forState:UIControlStateNormal];
    [editButton addTarget:self action:@selector(editDeleteSiri)
         forControlEvents:UIControlEventTouchUpInside];
    editButton.backgroundColor =[ UIColor grayColor];
    [self.editButtonView addSubview:editButton];
    self.editButtonView.backgroundColor =[UIColor redColor];
    
//    self.siriAddButton.titleLabel.font = NORMAL_FONT_TYPE_18;
//    self.siriAddButton.titleLabel.textColor = BLACK_COLOR_FONT;
    
}

-(void)showSiri{
    
    self.myDonatedIntent = [[ViewDetailsIntent alloc] init];
    self.myDonatedIntent.userName = self.nameFiledText.text;
    self.myDonatedIntent.age = self.ageFiledText.text;
    
    INShortcut *shortCut = [[INShortcut alloc] initWithIntent:self.myDonatedIntent];
    
    INUIAddVoiceShortcutViewController *addSiri = [[INUIAddVoiceShortcutViewController alloc]initWithShortcut:shortCut];
    addSiri.delegate = self;
    [self presentViewController:addSiri animated:YES completion:nil];
}

- (void)addVoiceShortcutViewController:(INUIAddVoiceShortcutViewController *)controller
            didFinishWithVoiceShortcut:(INVoiceShortcut *)voiceShortcut
                                 error:(NSError *)error API_AVAILABLE(ios(12.0)) API_AVAILABLE(ios(12.0)){
    
    INInteraction *myInteractionObject = [[INInteraction alloc] initWithIntent:self.myDonatedIntent response:nil];
    
    [myInteractionObject donateInteractionWithCompletion:^(NSError * _Nullable error) {
        if(error){
            
        }
        else{
            NSLog(@"donated suu=ccessfully");
            self.donatedShortCut = voiceShortcut;
        }
    }];

    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)addVoiceShortcutViewControllerDidCancel:(INUIAddVoiceShortcutViewController *)controller API_AVAILABLE(ios(12.0)){
    
    //NSLog(@"Siri add cancelled");
    [controller dismissViewControllerAnimated:YES completion:nil];
    
}


-(void)editDeleteSiri{
    INVoiceShortcut *shortCut = self.donatedShortCut;
    //NSLog(@"shortcut to be deleted is %@",shortCut.invocationPhrase);
    
    if (@available(iOS 12.0, *)) {
        //        INShortcut *shortCut = [[INShortcut alloc] initWithIntent:self.myIntent];
        self.editSiri = [[INUIEditVoiceShortcutViewController alloc] initWithVoiceShortcut:shortCut];
        self.editSiri.delegate = self;
        [self presentViewController:self.editSiri animated:YES completion:nil];
    } else {
        // Fallback on earlier versions
    }
    
    if (@available(iOS 12.0, *)) {
        //        INUIEditVoiceShortcutViewController *editSiri = [[INUIEditVoiceShortcutViewController alloc] initWithVoiceShortcut:self.myIntent];
    } else {
        // Fallback on earlier versions
    }
}


- (void)editVoiceShortcutViewControllerDidCancel:(INUIEditVoiceShortcutViewController *)controller{
    
    // NSLog(@"did cancel called");
    [self.editSiri dismissViewControllerAnimated:YES completion:nil];
}

- (void)editVoiceShortcutViewController:(INUIEditVoiceShortcutViewController *)controller didDeleteVoiceShortcutWithIdentifier:(NSUUID *)deletedVoiceShortcutIdentifier{
    
    [INInteraction deleteAllInteractionsWithCompletion:^(NSError * _Nullable error) {
        //NSLog(@"all interactions deleted");
    }];

    
    //NSLog(@"did delete has been called");
    [self.editSiri dismissViewControllerAnimated:YES completion:nil];
}


- (void)editVoiceShortcutViewController:(INUIEditVoiceShortcutViewController *)controller
                 didUpdateVoiceShortcut:(INVoiceShortcut *)voiceShortcut
                                  error:(NSError *)error API_AVAILABLE(ios(12.0)){
    
    INInteraction *myInteractionObject = [[INInteraction alloc] initWithIntent:self.myDonatedIntent response:nil];
    [myInteractionObject donateInteractionWithCompletion:^(NSError * _Nullable error)
     {
         if (error)
         {
             NSLog(@"Failed to donate interaction: %@ ", [error localizedDescription] );
         }
         
         else{
             self.donatedShortCut = voiceShortcut;

             ;
         }
     }];
    
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    
    // NSLog(@"edit siri called");
}

@end
