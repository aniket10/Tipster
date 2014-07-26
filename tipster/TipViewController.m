//
//  TipViewController.m
//  tipster
//
//  Created by Aniket Ajagaonkar on 7/25/14.
//  Copyright (c) 2014 Aniket Ajagaonkar. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()

@property (nonatomic,strong) NSArray * tipAmount;

- (void) updateBillAmount;
  
@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
        self.tipAmount = @[@(0.1),@(0.15),@(0.2)];
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.billTextField.delegate = self;
    self.tipControl.selectedSegmentIndex = 1;
    [self.tipControl addTarget:self action:@selector(updateBillAmount) forControlEvents:UIControlEventValueChanged];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onDoneButton)];
    
    return YES;
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField {
    self.navigationItem.rightBarButtonItem = nil;
    [self updateBillAmount];
    return YES;
}

- (void)onDoneButton {
    [self.view endEditing:YES];
}

- (void) updateBillAmount {
    float billAmount = [self.billTextField.text floatValue];
    float tipPercentage = [self.tipAmount [self.tipControl.selectedSegmentIndex] floatValue];
    
    float totalTip = billAmount * tipPercentage;
    float total = billAmount + totalTip;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f",totalTip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f",total];
}

@end
