//
//  CountViewController.h
//  CountDown
//
//  Created by iOS on 28/04/15.
//  Copyright (c) 2015 GIS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface CountViewController : UIViewController

@property int dateNum;
@property int monthNum;
@property int yearNum;
@property NSString *name;

@property (weak, nonatomic) IBOutlet UILabel *dateCountLbl;
@property (weak, nonatomic) IBOutlet UILabel *monthCountLbl;
@property (weak, nonatomic) IBOutlet UILabel *yearCountLbl;
@property (weak, nonatomic) IBOutlet UIImageView *smileImgView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLbl;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;

- (IBAction)backBtnClicked:(id)sender;
- (IBAction)actionBtnClicked:(id)sender;

@end
