//
//  ViewController.m
//  Tipster
//
//  Created by frankboamps on 6/25/19.
//  Copyright © 2019 frankboamps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//Segmented controls to link bill values to both tip value and total value
@property (weak, nonatomic) IBOutlet UITextField *mealBillField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (IBAction)handleSelection:(UIButton *)sender {
}

#pragma mark - View controller lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Initializing tap Button
- (IBAction)onTap:(id)sender {
    [self.view endEditing:TRUE];
}

#pragma mark - Edit action when textfield is touched
- (IBAction)onEdit:(id)sender {
    double bill = [self.mealBillField.text doubleValue];
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    double tip = tipPercentage * bill;
    double total = bill + tip;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

#pragma mark - begining editing textfield call
- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration: 0.2 animations:^{
    self.mealBillField.frame = CGRectMake(
        self.mealBillField.frame.origin.x,
        self.mealBillField.frame.origin.y + 30,
        self.mealBillField.frame.size.width,
        self.mealBillField.frame.size.height);
    }];
    [UIView animateWithDuration: 1 animations:^{
        self.tipLabel.alpha = 0;
    }];
}

#pragma mark - ending editing textfield call
- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.mealBillField.frame;
    newFrame.origin.y -= 30;
    [UIView animateWithDuration: 0.2 animations:^{
        self.mealBillField.frame = newFrame;
    }];
    [UIView animateWithDuration: 1 animations:^{
        self.tipLabel.alpha = 1;
    }];
}

@end
