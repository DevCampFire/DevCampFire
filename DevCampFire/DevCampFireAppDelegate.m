//
//  DevCampFireAppDelegate.m
//  DevCampFire
//
//  Created by Samuel on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DevCampFireAppDelegate.h"
#import "RootViewController.h"
#import <RestKit/RestKit.h>
#import <RestKit/CoreData/CoreData.h>
#import "DCEvent.h"
#import "DCProject.h"
#import "DCParticipant.h"

@implementation DevCampFireAppDelegate


@synthesize window=_window;
@synthesize managedObjectContext=__managedObjectContext;
@synthesize managedObjectModel=__managedObjectModel;
@synthesize persistentStoreCoordinator=__persistentStoreCoordinator;
@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    RootViewController *rootViewController = [[RootViewController alloc] init];
	rootViewController.managedObjectContext = self.managedObjectContext;
	UINavigationController* vC = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    vC.navigationBar.tintColor = [UIColor blackColor];
    
	[self setViewController:vC]; 
	[vC release];
	vC = nil;
    
    DCEvent *event = [NSEntityDescription insertNewObjectForEntityForName:@"DCEvent" inManagedObjectContext:self.managedObjectContext];
    event.name = @"Mirego";
    event.latitude = [NSNumber numberWithDouble:46.79123];
    event.longitude = [NSNumber numberWithDouble:-71.28788];
    event.siteURL = @"http://www.iosdevcampcanada.org/horaire";
    
    DCProject *project = [NSEntityDescription insertNewObjectForEntityForName:@"DCProject" inManagedObjectContext:self.managedObjectContext];
    project.name = @"iOS DevCamp Manager";
    project.tags = @"#event managing #organization";
    project.detail = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt neque at justo volutpat id dignissim enim sollicitudin. Fusce tincidunt hendrerit tortor eu tempus. Quisque sit amet euismod nisi. Mauris porta vehicula ipsum vitae tempus. Mauris ac diam eget odio varius placerat. Praesent posuere sem at elit aliquam vel pulvinar quam sollicitudin. Aliquam semper volutpat massa eget dignissim. Nam nec nibh sed erat mollis interdum. Praesent tempus ligula risus. Morbi id lectus in nibh fringilla tempor. Aliquam sodales, dui vitae ornare viverra, enim urna faucibus ligula, et ullamcorper mauris felis non risus. Nulla facilisi.";
    
    DCParticipant *participant = [NSEntityDescription insertNewObjectForEntityForName:@"DCParticipant" inManagedObjectContext:self.managedObjectContext];
    participant.firstName = @"Hugo";
    participant.lastName = @"Plante";
    
    [project addParticipantsObject:participant];
    
    DCParticipant *participant2 = [NSEntityDescription insertNewObjectForEntityForName:@"DCParticipant" inManagedObjectContext:self.managedObjectContext];
    participant2.firstName = @"Samuel";
    participant2.lastName = @"Tremblay";
    
    [project addParticipantsObject:participant2];
    
    [event addProjectsObject:project];
    
    DCProject *project2 = [NSEntityDescription insertNewObjectForEntityForName:@"DCProject" inManagedObjectContext:self.managedObjectContext];
    project2.name = @"Jaw Breaker";
    
    [event addProjectsObject:project2];
    
    
    [self.managedObjectContext save:nil];
    
    // Override point for customization after application launch.
    [self.window addSubview: [[self viewController] view]];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)dealloc
{
    [_window release];
    [__managedObjectContext release];
    [__managedObjectModel release];
    [__persistentStoreCoordinator release];
    [super dealloc];
}

- (void)awakeFromNib
{
    /*
     Typically you should set up the Core Data stack here, usually by passing the managed object context to the first view controller.
     self.<#View controller#>.managedObjectContext = self.managedObjectContext;
    */
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil)
    {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil)
    {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"DevCampFire" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    return __managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil)
    {
        return __persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"DevCampFire.sqlite"];
    
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return __persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
