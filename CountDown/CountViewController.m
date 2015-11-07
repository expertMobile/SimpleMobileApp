//
//  CountViewController.m
//  CountDown
//
//  Created by iOS on 28/04/15.
//  Copyright (c) 2015 GIS. All rights reserved.
//

#import "CountViewController.h"
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

#define TIME 86400
@interface CountViewController ()<UIActionSheetDelegate, MFMailComposeViewControllerDelegate>
{
    int currentDateNum;
    int currentMonthNum;
    int currentYearNum;
}

@property (strong, nonatomic) NSTimer* timer;
@property NSURL *appUrl;

@end

@implementation CountViewController

- (void)refresh:(NSTimer*) timer
{
    [self viewWillAppear:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.bannerView.adUnitID = @"ca-app-pub-6727494419584909/2692961670";
    self.bannerView.rootViewController = self;
    
    GADRequest *request = [GADRequest request];
    [self.bannerView loadRequest:request];
    /******* Timer *******/
    self.timer = [NSTimer timerWithTimeInterval:TIME target:self selector:@selector(refresh:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    /*********************/
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            
            break;
        case MFMailComposeResultSaved:
            
            break;
        case MFMailComposeResultSent:
            
            break;
        case MFMailComposeResultFailed:
            
            break;
        default:
            break;
    }
    
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        SLComposeViewController *mySLComposerSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [mySLComposerSheet setInitialText:[NSString stringWithFormat:@"Follow us  %@", _appUrl]];
        [mySLComposerSheet addImage:[UIImage imageNamed:@"smiley 0 to 5 years.png"]];
        
        
        [self presentViewController:mySLComposerSheet animated:YES completion:^{
            
        }];
    }
    else if (buttonIndex == 1){
        MFMailComposeViewController *mail = [[MFMailComposeViewController alloc] init];
        mail.mailComposeDelegate = self;
        if ([MFMailComposeViewController canSendMail]) {
            
            [mail setToRecipients:[NSArray arrayWithObjects:@"email@email.com",nil]];
            [mail setSubject:@"Best Wishes To You"];
            
            //        [mail setMessageBody:[NSString stringWithFormat:@"Join the new application. I'm here! Download app  %@", AppUrl] isHTML:NO];
            
            
            
            NSData *dataImage = [NSData dataWithData:UIImagePNGRepresentation([UIImage imageNamed:@"smiley 0 to 5 years.png"])];
            
            [mail addAttachmentData:dataImage
                           mimeType:@"image/png"
                           fileName:@"Photo.png"];
            
            [self presentViewController:mail animated:YES completion:nil];
            
        }
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    _userNameLbl.text = _name;
    
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy-MM-dd"];
    NSDate *startDate = [NSDate date];
    NSLog(@"%@", startDate);
    NSString *end = [NSString stringWithFormat:@"%d-%d-%d", _yearNum, _monthNum, _dateNum];
    NSDate *endDate = [f dateFromString:end];
    NSLog(@"%@", endDate);
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [gregorianCalendar components:NSDayCalendarUnit
                                                        fromDate:startDate
                                                          toDate:endDate
                                                         options:0];
    NSLog(@"%ld", (long)components.day);
    
    int year = (int)components.day / 365;
    int month = (int)components.day % 365 / 30;
    int date = (int)components.day % 365 % 30;
    
    if (year >= 0 && year < 5) {
        _smileImgView.image = [UIImage imageNamed:@"smiley 0 to 5 years.png"];
    }
    
    if (year >= 5 && year < 10) {
        _smileImgView.image = [UIImage imageNamed:@"smiley 5 to 10 years.png"];
    }
    
    if (year >= 10) {
        _smileImgView.image = [UIImage imageNamed:@"smiley - 15 years.png"];
    }
    
    _monthCountLbl.text = [NSString stringWithFormat:@"%d", month];
    _dateCountLbl.text = [NSString stringWithFormat:@"%d", date];
    _yearCountLbl.text = [NSString stringWithFormat:@"%d", year];
    
    self.navigationController.navigationBar.hidden = TRUE;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtnClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)actionBtnClicked:(id)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Facebook" otherButtonTitles:@"Email", nil];
    
    [sheet showInView:self.view];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
