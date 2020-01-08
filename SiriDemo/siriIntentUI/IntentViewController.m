//
//  IntentViewController.m
//  siriIntentUI
//
//  Created by Ritheesh on 18/06/19.
//  Copyright © 2019 Ritheesh. All rights reserved.
//

#import "IntentViewController.h"

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

@interface IntentViewController (){
   
}
@property ( nonatomic) ViewDetailsIntentResponse *response;


@end

@implementation IntentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailTableView=[[UITableView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width-20,2*60)];
    self.detailTableView.backgroundColor=[UIColor clearColor];
    self.detailTableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:self.detailTableView];
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    return self.response.fullAccountDetails.count;
    return 2;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"identifier"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"identifier"];
        cell.backgroundView=nil;
        cell.selectedBackgroundView=nil;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    
    if (indexPath.row ==0) {
        cell.textLabel.text = @"Name";
        cell.detailTextLabel.text = self.response.name;
    }
    else {
        cell.textLabel.text = @"Age";
        cell.detailTextLabel.text = self.response.age;
    }
    
    
    
    return cell;
}



#pragma mark - INUIHostedViewControlling

// Prepare your view controller for the interaction to handle.
- (void)configureViewForParameters:(NSSet <INParameter *> *)parameters ofInteraction:(INInteraction *)interaction interactiveBehavior:(INUIInteractiveBehavior)interactiveBehavior context:(INUIHostedViewContext)context completion:(void (^)(BOOL success, NSSet <INParameter *> *configuredParameters, CGSize desiredSize))completion {
    // Do configuration here, including preparing views and calculating a desired size for presentation.
    
    if (@available(iOS 12.0, *)) {
        
        self.response = [[ViewDetailsIntentResponse alloc] initWithCode:ViewDetailsIntentResponseCodeSuccess userActivity:nil];
        self.response = (ViewDetailsIntentResponse *)interaction.intentResponse;

        
        self.detailTableView.dataSource = self;
        self.detailTableView.delegate = self;
        [self.detailTableView reloadData];
        
        
    } else {
        // Fallback on earlier versions
    }
    
    if (completion) {
        completion(YES, parameters, [self desiredSize]);
    }
}

- (CGSize)desiredSize {
    return  CGSizeMake(self.view.frame.size.width,2*60);
}

@end
