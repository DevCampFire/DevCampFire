//
//  DCProject.h
//  DevCampFire
//
//  Created by Samuel on 7/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class DCEvent;

@interface DCProject : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * detail;
@property (nonatomic, retain) NSString * siteURL;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * tags;
@property (nonatomic, retain) NSManagedObject * organizer;
@property (nonatomic, retain) DCEvent * event;
@property (nonatomic, retain) NSSet* participants;

@end
