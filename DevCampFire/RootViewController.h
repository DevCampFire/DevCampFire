//
//  RootViewController.h
//  DevCampFire
//
//  Created by Samuel on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SignInViewController.h"

@interface RootViewController : UIViewController <MKMapViewDelegate, SignInViewDelegate, NSFetchedResultsControllerDelegate> {
    
    MKMapView *mapView;
    NSMutableArray *mapAnnotations;
    UIBarButtonItem *btnUser;
    NSFetchedResultsController *fetchedResultsController;
    NSMutableArray *allEvents;
    
}

@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) NSMutableArray *mapAnnotations;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSMutableArray *allEvents;

@end
