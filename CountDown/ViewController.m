//
//  ViewController.m
//  CountDown
//
//  Created by Yuan on 4/28/15.
//  Copyright (c) 2015 GIS. All rights reserved.
//

#import "ViewController.h"
#import "CountViewController.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface ViewController ()<UITextFieldDelegate>

@property int dateNum;
@property int monthNum;
@property int yearNum;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _datePicker.backgroundColor = [UIColor whiteColor];
    _datePicker.datePickerMode = UIDatePickerModeDate;
    _dateLbl.layer.cornerRadius = 8;
    _dateLbl.layer.masksToBounds = YES;
    _monthLbl.layer.cornerRadius = 8;
    _monthLbl.layer.masksToBounds = YES;
    _yearLbl.layer.cornerRadius = 8;
    _yearLbl.layer.masksToBounds = YES;
    
    self.bannerView.adUnitID = @"ca-app-pub-6727494419584909/2692961670";
    self.bannerView.rootViewController = self;
    
    GADRequest *request = [GADRequest request];
    [self.bannerView loadRequest:request];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"date"]) {
        _dateLbl.text = [[NSUserDefaults standardUserDefaults]
                         objectForKey:@"date"];
        _dateNum = [_dateLbl.text intValue];
    }
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"month"]) {
        _monthLbl.text = [[NSUserDefaults standardUserDefaults]
                         objectForKey:@"month"];
        NSString *month = _monthLbl.text;
        if ([month isEqualToString:@"January"]) {
            _monthNum = 1;
        }
        if ([month isEqualToString:@"February"]) {
            _monthNum = 2;
        }
        if ([month isEqualToString:@"March"]) {
            _monthNum = 3;
        }
        if ([month isEqualToString:@"April"]) {
            _monthNum = 4;
        }
        if ([month isEqualToString:@"May"]) {
            _monthNum = 5;
        }
        if ([month isEqualToString:@"June"]) {
            _monthNum = 6;
        }
        if ([month isEqualToString:@"July"]) {
            _monthNum = 7;
        }
        if ([month isEqualToString:@"Augst"]) {
            _monthNum = 8;
        }
        if ([month isEqualToString:@"September"]) {
            _monthNum = 9;
        }
        if ([month isEqualToString:@"October"]) {
            _monthNum = 10;
        }
        if ([month isEqualToString:@"November"]) {
            _monthNum = 11;
        }
        if ([month isEqualToString:@"December"]) {
            _monthNum = 12;
        }
        
    }
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"year"]) {
        _yearLbl.text = [[NSUserDefaults standardUserDefaults]
                         objectForKey:@"year"];
        _yearNum = [_yearLbl.text intValue];
    }
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"name"]) {
        _nameTxt.text = [[NSUserDefaults standardUserDefaults]
                         objectForKey:@"name"];
    }
    self.navigationController.navigationBar.hidden = TRUE;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    return TRUE;
}

- (IBAction)enterBtnClicked:(id)sender {
    if ([_nameTxt.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Name Error" message:@"Input Name" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        [alert show];
    }
    else{
        if (_yearNum >= 2015) {
            [[NSUserDefaults standardUserDefaults] setObject:_nameTxt.text
                                                      forKey:@"name"];
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            CountViewController *myVC = (CountViewController *)[storyboard instantiateViewControllerWithIdentifier:@"CountView"];
            myVC.dateNum = _dateNum;
            myVC.monthNum = _monthNum;
            myVC.yearNum = _yearNum;
            myVC.name = _nameTxt.text;
            [self.navigationController pushViewController:myVC animated:YES];
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Setting Error" message:@"Set Year Again" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            [alert show];
        }
    }
}

- (IBAction)pickerAction:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMddyyyy"];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self.datePicker.date];
    _dateNum = (int)[components day];
    _monthNum = (int)[components month];
    _yearNum = (int)[components year];
    
    NSString *month = nil;
    switch (_monthNum) {
        case 1:
            month = @"January";
            break;
        case 2:
            month = @"February";
            break;
        case 3:
            month = @"March";
            break;
        case 4:
            month = @"April";
            break;
        case 5:
            month = @"May";
            break;
        case 6:
            month = @"June";
            break;
        case 7:
            month = @"July";
            break;
        case 8:
            month = @"Augst";
            break;
        case 9:
            month = @"September";
            break;
        case 10:
            month = @"October";
            break;
        case 11:
            month = @"November";
            break;
        case 12:
            month = @"December";
            break;
        default:
            break;
    }
    
    _dateLbl.text = [NSString stringWithFormat:@"%d", _dateNum];
    _monthLbl.text = month;
    _yearLbl.text = [NSString stringWithFormat:@"%d", _yearNum];
}

- (IBAction)doneBtnClicked:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMddyyyy"];
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self.datePicker.date];
    _dateNum = (int)[components day];
    _monthNum = (int)[components month];
    _yearNum = (int)[components year];
    
    NSString *month = nil;
    switch (_monthNum) {
        case 1:
            month = @"January";
            break;
        case 2:
            month = @"February";
            break;
        case 3:
            month = @"March";
            break;
        case 4:
            month = @"April";
            break;
        case 5:
            month = @"May";
            break;
        case 6:
            month = @"June";
            break;
        case 7:
            month = @"July";
            break;
        case 8:
            month = @"Augst";
            break;
        case 9:
            month = @"September";
            break;
        case 10:
            month = @"October";
            break;
        case 11:
            month = @"November";
            break;
        case 12:
            month = @"December";
            break;
        default:
            break;
    }
    
    _dateLbl.text = [NSString stringWithFormat:@"%d", _dateNum];
    _monthLbl.text = month;
    _yearLbl.text = [NSString stringWithFormat:@"%d", _yearNum];
    
    [[NSUserDefaults standardUserDefaults] setObject:_dateLbl.text
                                              forKey:@"date"];
    [[NSUserDefaults standardUserDefaults] setObject:_monthLbl.text
                                              forKey:@"month"];
    [[NSUserDefaults standardUserDefaults] setObject:_yearLbl.text
                                              forKey:@"year"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [UIView animateWithDuration:0.7 animations:^{
        _pickerView.frame = CGRectMake(0, 568, _pickerView.frame.size.width, _pickerView.frame.size.height);
    }completion:^(BOOL finished){
        
    }];
}

- (IBAction)dateBtnClicked:(id)sender {
    [UIView animateWithDuration:0.7 animations:^{
        _pickerView.frame = CGRectMake(0, 372, _pickerView.frame.size.width, _pickerView.frame.size.height);
    }completion:^(BOOL finished){
        
    }];
}

- (IBAction)monthBtnClicked:(id)sender {
    [UIView animateWithDuration:0.7 animations:^{
        _pickerView.frame = CGRectMake(0, 372, _pickerView.frame.size.width, _pickerView.frame.size.height);
    }completion:^(BOOL finished){
        
    }];
}

- (IBAction)yearBtnClicked:(id)sender {
    [UIView animateWithDuration:0.7 animations:^{
        _pickerView.frame = CGRectMake(0, 372, _pickerView.frame.size.width, _pickerView.frame.size.height);
    }completion:^(BOOL finished){
        
    }];
}

@end
