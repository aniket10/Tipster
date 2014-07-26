//
//  TipViewController.h
//  tipster
//
//  Created by Aniket Ajagaonkar on 7/25/14.
//  Copyright (c) 2014 Aniket Ajagaonkar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic,weak) IBOutlet UITextField *billTextField;
@property (nonatomic,weak) IBOutlet UILabel *tipLabel;
@property (nonatomic,weak) IBOutlet UILabel *totalLabel;
@property (nonatomic,weak) IBOutlet UISegmentedControl *tipControl;

- (IBAction) onDoneButton;

@end
