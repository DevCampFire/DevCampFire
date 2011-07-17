//
//  EventDetailViewController.h
//  DevCampFire
//
//  Created by Samuel on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCEvent.h"

@interface EventDetailViewController : UITableViewController {
    
    DCEvent *event;
}

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) DCEvent *event;

- (void) addHeaderAndFooter;

@end
