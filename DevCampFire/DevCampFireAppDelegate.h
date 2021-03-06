//
//  DevCampFireAppDelegate.h
//  DevCampFire
//
//  Created by Samuel on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DCParticipant;

@interface DevCampFireAppDelegate : NSObject <UIApplicationDelegate> {

    UINavigationController *viewController;
    DCParticipant *participant;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain) UINavigationController *viewController;
@property (nonatomic, retain) DCParticipant *participant;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
