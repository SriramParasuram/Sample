//
//  IntentViewController.h
//  siriIntentUI
//
//  Created by Ritheesh on 18/06/19.
//  Copyright © 2019 Ritheesh. All rights reserved.
//

#import <IntentsUI/IntentsUI.h>
#import <IntentDefinitionGenerated/MyCustomIntent/ViewDetailsIntent.h>

@interface IntentViewController : UIViewController <INUIHostedViewControlling,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic) UITableView *detailTableView;
@end
