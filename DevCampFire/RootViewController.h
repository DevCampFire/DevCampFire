//
//  RootViewController.h
//  DevCampFire
//
//  Created by Samuel on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface RootViewController : UIViewController <MKMapViewDelegate, NSFetchedResultsControllerDelegate> {
    
    MKMapView *mapView;
    NSMutableArray *mapAnnotations;
    UIBarButtonItem *btnUser;
    NSFetchedResultsController *fetchedResultsController;
    
}

@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) NSMutableArray *mapAnnotations;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end
