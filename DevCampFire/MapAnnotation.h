//
//  MapAnnotation.h
//  DevCampFire
//
//  Created by Samuel Tremblay on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject <MKAnnotation> {
    
    UIImage *image;
    NSNumber *latitude;
    NSNumber *longitude;
    //Store *store;
}

@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *longitude;
//@property (nonatomic, strong) Store *store;

@end
