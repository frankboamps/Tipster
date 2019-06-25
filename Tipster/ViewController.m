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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onTap:(id)sender {// Feature to ensure that keyboard moves away when outside textfield is tappe3d
    NSLog(@"Hello");
    [self.view endEditing:TRUE];
}

- (IBAction)onEdit:(id)sender {
    double bill = [self.mealBillField.text doubleValue]; //call method doubleValue on object entered in textfield
    
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];   // NSArray containing NS numbers based on tip percentage specified
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];// Calling the double method on the NSNumbers available in the NSArray
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total]; // creating NSString based on specified format
    
}
- (IBAction)onEditingBegin:(id)sender {// Specify sreen orientation once user begins to edit information on app textfield
    [UIView animateWithDuration: 0.2 animations:^{
    self.mealBillField.frame = CGRectMake(
        self.mealBillField.frame.origin.x,
        self.mealBillField.frame.origin.y + 30,
        self.mealBillField.frame.size.width,
        self.mealBillField.frame.size.height);
    }]; // Creating animations for frame when info is updated
    
    [UIView animateWithDuration: 1 animations:^{
        self.tipLabel.alpha = 0;
    }]; // Creating animations for tip label
    
}

- (IBAction)onEditingEnd:(id)sender {// Specify sreen orientation once user ends editing information on app textfield but this time using new implementation different from above
    CGRect newFrame = self.mealBillField.frame;
    newFrame.origin.y -= 30;
    
    [UIView animateWithDuration: 0.2 animations:^{
        self.mealBillField.frame = newFrame;
    }]; // Creating animations for frame
    
    [UIView animateWithDuration: 1 animations:^{
        self.tipLabel.alpha = 1;
    }]; // Creating animations for Tip Label
}

@end
