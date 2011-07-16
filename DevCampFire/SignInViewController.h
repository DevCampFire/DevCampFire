//
//  SignInViewController.h
//  DevCampFire
//
//  Created by Hugo Plante on 11-07-16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RegisterViewController;

@protocol SignInViewDelegate <NSObject>
-(void)didFinish:(UIViewController*)view;
@end

@interface SignInViewController : UIViewController <UITextFieldDelegate> {
    IBOutlet UITextField *usernameTextField;
    IBOutlet UITextField *passwordTextField;
    
    RegisterViewController *registerView;
    id<SignInViewDelegate> delegate;
}

@property (nonatomic,assign) id<SignInViewDelegate> delegate;

- (IBAction) doRegister:(id)sender;
- (IBAction) doSignIn:(id)sender;
- (IBAction) cancel:(id)sender;

@end
