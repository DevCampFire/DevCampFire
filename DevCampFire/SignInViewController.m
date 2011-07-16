//
//  SignInViewController.m
//  DevCampFire
//
//  Created by Hugo Plante on 11-07-16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SignInViewController.h"
#import "RegisterViewController.h"

@implementation SignInViewController
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (IBAction) doRegister:(id)sender {
    //Register in navigation
    registerView = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
    registerView.delegate = delegate;
    [registerView.view setFrame:self.view.bounds];
    
    [UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight
						   forView:[self view]
							 cache:YES];
	[[self view] addSubview:registerView.view];
	[UIView commitAnimations];
}

- (IBAction) doSignIn:(id)sender {
    [delegate didFinish:self];
}

- (IBAction) cancel:(id)sender {
    [delegate didFinish:self];
}

@end
