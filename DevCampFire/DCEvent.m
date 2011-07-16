//
//  DCEvent.m
//  DevCampFire
//
//  Created by Samuel on 7/16/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DCEvent.h"


@implementation DCEvent
@dynamic siteURL;
@dynamic longitude;
@dynamic videoStreamURL;
@dynamic latitude;
@dynamic twitterHandle;
@dynamic name;
@dynamic organizer;
@dynamic projects;


- (void)addProjectsObject:(NSManagedObject *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"projects" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"projects"] addObject:value];
    [self didChangeValueForKey:@"projects" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeProjectsObject:(NSManagedObject *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"projects" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"projects"] removeObject:value];
    [self didChangeValueForKey:@"projects" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addProjects:(NSSet *)value {    
    [self willChangeValueForKey:@"projects" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"projects"] unionSet:value];
    [self didChangeValueForKey:@"projects" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeProjects:(NSSet *)value {
    [self willChangeValueForKey:@"projects" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"projects"] minusSet:value];
    [self didChangeValueForKey:@"projects" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
