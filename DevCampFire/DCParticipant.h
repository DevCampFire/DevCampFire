//
//  DCParticipant.h
//  DevCampFire
//
//  Created by Samuel on 7/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DCEvent, DCProject;

@interface DCParticipant : NSManagedObject {
@private
}
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * twitterHandle;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) DCEvent * eventOrganized;
@property (nonatomic, retain) DCProject * projectOrganized;
@property (nonatomic, retain) DCProject * project;

@end
