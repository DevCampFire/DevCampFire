//
//  MapAnnotation.h
//  DevCampFire
//
//  Created by Samuel Tremblay on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "DCEvent.h"

@interface MapAnnotation : NSObject <MKAnnotation> {
    
    UIImage *image;
    NSNumber *latitude;
    NSNumber *longitude;
    NSNumber *tag;
    DCEvent *event;
}

@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *longitude;
@property (nonatomic, retain) NSNumber *tag;
@property (nonatomic, retain) DCEvent *event;

@end
