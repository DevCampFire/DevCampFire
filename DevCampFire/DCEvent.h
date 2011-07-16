//
//  DCEvent.h
//  DevCampFire
//
//  Created by Samuel on 7/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DCEvent : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * siteURL;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * videoStreamURL;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSString * twitterHandle;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSManagedObject * organizer;
@property (nonatomic, retain) NSSet* projects;

- (void)addProjectsObject:(NSManagedObject *)value;
- (void)removeProjectsObject:(NSManagedObject *)value;
- (void)addProjects:(NSSet *)value;
- (void)removeProjects:(NSSet *)value;

@end
