//
//  RootViewController.h
//  DevCampFire
//
//  Created by Samuel on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface RootViewController : UIViewController <MKMapViewDelegate> {
    
    MKMapView *mapView;
    NSMutableArray *mapAnnotations;
    UIBarButtonItem *btnUser;
}

@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) NSMutableArray *mapAnnotations;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
