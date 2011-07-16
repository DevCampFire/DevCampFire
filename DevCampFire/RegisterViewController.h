//
//  RegisterViewController.h
//  DevCampFire
//
//  Created by Hugo Plante on 11-07-16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "SignInViewController.h"
#import "ChoiceViewController.h"

@interface RegisterViewController : UIViewController <UITextFieldDelegate, CLLocationManagerDelegate, MKReverseGeocoderDelegate, ChoiceViewDelegate> {
    
    IBOutlet UITextField *firstNameTextField;
    IBOutlet UITextField *lastNameTextField;
    IBOutlet UITextField *emailTextField;
    IBOutlet UITextField *roleTextField;
    IBOutlet UITextField *twitterTextField;
    IBOutlet UITextField *locationTextField;
    IBOutlet UITextField *passwordTextField;
    IBOutlet UITextField *passwordConfirmTextField;
    
    CLLocationManager *locationManager;
    
    ChoiceViewController *roleChoiceCtrl;
    UIPopoverController *rolePopover;
    
    id<SignInViewDelegate> delegate;
}


@property (nonatomic,assign) id<SignInViewDelegate> delegate;

@property (nonatomic,retain) ChoiceViewController *roleChoiceCtrl;
@property (nonatomic,retain) UIPopoverController *rolePopover;

- (IBAction) doRegister:(id)sender;
- (IBAction) cancel:(id)sender;

@end
