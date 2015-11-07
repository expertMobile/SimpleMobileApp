//
//  ViewController.h
//  CountDown
//
//  Created by Yuan on 4/28/15.
//  Copyright (c) 2015 GIS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GADBannerView;

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTxt;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *dateLbl;
@property (weak, nonatomic) IBOutlet UILabel *monthLbl;
@property (weak, nonatomic) IBOutlet UILabel *yearLbl;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

- (IBAction)enterBtnClicked:(id)sender;
- (IBAction)pickerAction:(id)sender;
- (IBAction)doneBtnClicked:(id)sender;
- (IBAction)dateBtnClicked:(id)sender;
- (IBAction)monthBtnClicked:(id)sender;
- (IBAction)yearBtnClicked:(id)sender;

@end
