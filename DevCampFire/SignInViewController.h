//
//  SignInViewController.h
//  DevCampFire
//
//  Created by Hugo Plante on 11-07-16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SignInViewController : UIViewController {
    IBOutlet UITextField *usernameTextField;
    IBOutlet UITextField *passwordTextField;
}

- (IBAction) doRegister:(id)sender;

@end
