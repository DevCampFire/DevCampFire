//
//  ChoiceViewController.h
//  DevCampFire
//
//  Created by Hugo Plante on 7/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChoiceViewDelegate;

@interface ChoiceViewController : UITableViewController {
	NSArray *arrayOfStrings;
	id<ChoiceViewDelegate> delegate;
}

@property (nonatomic, retain) NSArray *arrayOfStrings;
@property (nonatomic, assign) id<ChoiceViewDelegate> delegate;

@end

@protocol ChoiceViewDelegate <NSObject>
	-(void)didTapItem:(NSString *)string atIndex:(NSInteger)index;
@end