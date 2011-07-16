//
//  RegisterViewController.m
//  DevCampFire
//
//  Created by Hugo Plante on 11-07-16.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RegisterViewController.h"
#import <AddressBook/AddressBook.h>

@implementation RegisterViewController
@synthesize delegate;
@synthesize rolePopover;
@synthesize roleChoiceCtrl;

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
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    [locationManager startUpdatingLocation];
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
    [delegate didFinish:self];
}

- (IBAction) cancel:(id)sender {
    [delegate didFinish:self];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField == roleTextField) {
        if (roleChoiceCtrl == nil) {
            self.roleChoiceCtrl = [[[ChoiceViewController alloc] init] autorelease];
            self.roleChoiceCtrl.arrayOfStrings = [NSArray arrayWithObjects:@"Participant", @"Organizer", @"Mentor", nil];
            roleChoiceCtrl.delegate = self;
            self.rolePopover = [[[UIPopoverController alloc] 
                                        initWithContentViewController:roleChoiceCtrl] autorelease];               
        }
        [self.rolePopover presentPopoverFromRect:textField.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
        return NO;
    }
    else if (textField == locationTextField) {
        return NO;
    }
    return YES;
}

#pragma CLLocationManagerDelegate

// this delegate is called when the app successfully finds your current location
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation 
{
    // this creates a MKReverseGeocoder to find a placemark using the found coordinates
    MKReverseGeocoder *geoCoder = [[MKReverseGeocoder alloc] initWithCoordinate:newLocation.coordinate];
    geoCoder.delegate = self;
    [geoCoder start];
}

// this delegate method is called if an error occurs in locating your current location
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error 
{
    NSLog(@"locationManager:%@ didFailWithError:%@", manager, error);
}
// this delegate is called when the reverseGeocoder finds a placemark
- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
    MKPlacemark * myPlacemark = placemark;
    // with the placemark you can now retrieve the city name
    locationTextField.text = [myPlacemark.addressDictionary objectForKey:(NSString*) kABPersonAddressCityKey];
}

// this delegate is called when the reversegeocoder fails to find a placemark
- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error
{
    NSLog(@"reverseGeocoder:%@ didFailWithError:%@", geocoder, error);
    locationTextField.text = @"Can't get location";
}

#pragma ChoiceViewDelegate

-(void)didTapItem:(NSString *)string atIndex:(NSInteger)index {
    roleTextField.text = string;
}

@end
