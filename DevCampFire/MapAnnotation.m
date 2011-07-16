//
//  MapAnnotation.m
//  DevCampFire
//
//  Created by Samuel Tremblay on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapAnnotation.h"


@implementation MapAnnotation

@synthesize image;
@synthesize latitude;
@synthesize longitude;
@synthesize event;
@synthesize tag;

- (CLLocationCoordinate2D)coordinate;
{

    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = [latitude doubleValue];
    theCoordinate.longitude = [longitude doubleValue];
    
    return theCoordinate; 
}

- (NSString *)title
{
    return event.name;
}

// optional
- (NSString *)subtitle
{
    return nil;
}


-(void)setEvent:(DCEvent *)_event {
    
    if(_event){
        
        event = _event;
        latitude = event.latitude;
        longitude = event.longitude;

    }
}

@end
