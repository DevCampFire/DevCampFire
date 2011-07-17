//
//  ProjectDetailViewController.h
//  DevCampFire
//
//  Created by Samuel Tremblay on 7/16/11.
//  Copyright 2011 Nurun Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCProject.h"


@interface ProjectDetailViewController : UITableViewController {
    
    DCProject *project;
    
}

@property (nonatomic, retain) DCProject *project;

- (void) addHeaderAndFooter;

@end
