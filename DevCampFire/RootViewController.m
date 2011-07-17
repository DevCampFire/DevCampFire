//
//  RootViewController.m
//  DevCampFire
//
//  Created by Samuel on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "MapAnnotation.h"
#import "EventDetailViewController.h"
#import "DCEvent.h"

@implementation RootViewController

@synthesize mapView, mapAnnotations, managedObjectContext, fetchedResultsController, allEvents;

#pragma mark -

+ (CGFloat)annotationPadding;
{
    return 10.0f;
}
+ (CGFloat)calloutHeight;
{
    return 40.0f;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"iOS DevCamp Manager";
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.mapView.mapType = MKMapTypeStandard; //TODO make this parameter variable
	mapView.delegate = self;
    mapView.showsUserLocation = YES; //TODO make this parameter variable
    [self.view addSubview:mapView];
    
    
    //create toolbar using new
    UIToolbar *toolbar = [UIToolbar new];
    [toolbar sizeToFit];
    CGFloat toolbarHeight = [toolbar frame].size.height;
    toolbar.barStyle = UIBarStyleDefault;
    toolbar.tintColor = [UIColor blackColor];
    //TODO: make size dynamic
    toolbar.frame = CGRectMake(0, mapView.bounds.size.height - toolbarHeight - 44, self.view.bounds.size.width, toolbarHeight);
    [self.view addSubview:toolbar];
    
    btnUser = [[UIBarButtonItem alloc] initWithTitle:@"Sign In" 
                                                             style:UIBarButtonItemStyleBordered 
                                                            target:self 
                                                            action:@selector(buttonsActions:)];
    btnUser.tag = 0;
    
    UIBarButtonItem	*flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    NSArray *items = [NSArray arrayWithObjects: flex, btnUser, nil];
    
    [toolbar setItems:items animated:NO];
    [self.view addSubview:toolbar];
    
    
    allEvents = [[self.fetchedResultsController fetchedObjects] mutableCopy];
    
    //NSLog(@"%d", [allEvents count]);

    for (int i = 0; i < [allEvents count]; i++) {
        
        DCEvent *event = [[self.fetchedResultsController fetchedObjects] objectAtIndex:i];
        
        MapAnnotation *mapAnnotation = [[MapAnnotation alloc] init];
        mapAnnotation.event = event;
        mapAnnotation.tag = [NSNumber numberWithInt:i];
        
        //NSLog(@"%d", [[event.projects allObjects] count]);
        
        [self.mapView addAnnotation:mapAnnotation];
    }
    
    
    // annotation for the City of San Francisco
    MapAnnotation *mapAnnotation = [[MapAnnotation alloc] init];
    [self.mapView addAnnotation:mapAnnotation];
    [mapAnnotation release];
}

- (void) buttonsActions:(id)sender {
    
    UIBarButtonItem *button = (UIBarButtonItem *)sender;
    NSLog(@"%d", button.tag);
    
    
    switch (button.tag) {
        case 0:
        {
            //Sign in navigation
            SignInViewController *signInView = [[SignInViewController alloc] initWithNibName:@"SignInViewController" bundle:nil];
            signInView.delegate = self;
            signInView.modalPresentationStyle = UIModalPresentationPageSheet;
            
            // show the navigation controller modally
            [self presentModalViewController:signInView animated:YES];
            
            signInView.view.superview.backgroundColor = [UIColor colorWithRed:45.0/255.0 green:45.0/255.0 blue:45.0/255.0 alpha:1.0];
            signInView.view.superview.autoresizingMask = 
            UIViewAutoresizingFlexibleTopMargin | 
            UIViewAutoresizingFlexibleBottomMargin;    
            signInView.view.superview.frame = CGRectMake(
                                                             signInView.view.superview.frame.origin.x,
                                                             signInView.view.superview.frame.origin.y,
                                                             540.0f,
                                                             540.0f
                                                             );
            
            CGPoint centerPoint = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2);
            signInView.view.superview.center = centerPoint;
            
            // Clean up resources
            [signInView release];
            
            break;
        }
            
        default:
            break;
    }
}


- (NSFetchedResultsController *)fetchedResultsController {
    
    if (fetchedResultsController != nil) {
        return fetchedResultsController;
    }
    
    if(self.managedObjectContext != nil){
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"DCEvent" inManagedObjectContext:self.managedObjectContext];
        
        // Setup the fetch request
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        [fetchRequest setEntity:entity];
        
        // Define how we will sort the records
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        
        [fetchRequest setSortDescriptors:sortDescriptors];
        
        NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
        
        aFetchedResultsController.delegate = self;
        self.fetchedResultsController = aFetchedResultsController;
        
        
        [fetchedResultsController performFetch:nil];
    }
    return fetchedResultsController;
}


#pragma mark -
#pragma mark MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    // if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    
    if ([annotation isKindOfClass:[MapAnnotation class]])
    {
        static NSString* SFAnnotationIdentifier = @"AnnotationIdentifier";
        MKPinAnnotationView* pinView =
        (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:SFAnnotationIdentifier];
        if (!pinView)
        {
            MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation
                                                                            reuseIdentifier:SFAnnotationIdentifier];
            annotationView.canShowCallout = YES;
            
            UIImage *flagImage = [UIImage imageNamed:@"mapIcon.png"];
            
            CGRect resizeRect;
            
            resizeRect.size = flagImage.size;
            CGSize maxSize = CGRectInset(self.view.bounds,
                                         [RootViewController annotationPadding],
                                         [RootViewController annotationPadding]).size;
            maxSize.height -= self.navigationController.navigationBar.frame.size.height + [RootViewController calloutHeight];
            if (resizeRect.size.width > maxSize.width)
                resizeRect.size = CGSizeMake(maxSize.width, resizeRect.size.height / resizeRect.size.width * maxSize.width);
            if (resizeRect.size.height > maxSize.height)
                resizeRect.size = CGSizeMake(resizeRect.size.width / resizeRect.size.height * maxSize.height, maxSize.height);
            
            resizeRect.origin = (CGPoint){0.0f, 0.0f};
            UIGraphicsBeginImageContext(resizeRect.size);
            [flagImage drawInRect:resizeRect];
            UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            annotationView.image = resizedImage;
            annotationView.opaque = NO;
            
            UIImageView *sfIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
            annotationView.leftCalloutAccessoryView = sfIconView;
            
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            //[rightButton addTarget:self action:@selector(annotationAction:) forControlEvents:UIControlEventTouchUpInside];
            annotationView.rightCalloutAccessoryView = rightButton;
            
            return annotationView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
        
    }
    return nil;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
    
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    MapAnnotation *mapAnnotation = view.annotation;

    EventDetailViewController *eventDetailViewController = [[EventDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [eventDetailViewController setEvent:[allEvents objectAtIndex:[mapAnnotation.tag intValue]]];
    [self.navigationController pushViewController:eventDetailViewController animated:YES];
    [eventDetailViewController release];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didFinish:(UIViewController *)view {
    [self dismissModalViewControllerAnimated:true];
}

@end
