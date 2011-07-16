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
//@synthesize store;

- (CLLocationCoordinate2D)coordinate;
{

    CLLocationCoordinate2D theCoordinate;
    //theCoordinate.latitude = [store.latitude doubleValue];
    //theCoordinate.longitude = [store.longitude doubleValue];
    
    theCoordinate.latitude = 46.79123;
    theCoordinate.longitude = -71.28788;
    
    return theCoordinate; 
}

- (NSString *)title
{
    //return store.localizedName;
    return @"Mirego";
}

// optional
- (NSString *)subtitle
{
    //return store.address;
    return @"test";
}

/*
-(void)setStore:(Store *)_store{
    
    if(_store){
        
        store = _store;
    }
}
*/
@end
