//
//  EventDetailViewController.m
//  DevCampFire
//
//  Created by Samuel on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventDetailViewController.h"
#import "ProjectDetailViewController.h"
#import "SVWebViewController.h"
#import "DCProject.h"

@implementation EventDetailViewController

@synthesize managedObjectContext, event;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
        
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    //[self addHeaderAndFooter];
    

}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else {
        
        return [[event.projects allObjects] count]; //TODO: make this dynamic fetching project entities
    }
    // Return the number of rows in the section.
}
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
        return 40;
}


-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 20.0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectZero];
    headerView.backgroundColor = [UIColor clearColor];
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, -1, self.view.bounds.size.width, 30)];
    backgroundImage.image = [UIImage imageNamed:@"blackStrip.png"];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 2, 320, 20)];
    title.font = [UIFont boldSystemFontOfSize:12];
    title.textAlignment = UITextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    title.backgroundColor = [UIColor clearColor];
    
    if (section == 0) {
        title.text = @"Event Details";
    }
    if (section == 1) {
        title.text = @"Projects";
    }
    
    [headerView addSubview:backgroundImage];
    [headerView addSubview:title];
    [title release];
    [backgroundImage release];
    
    return headerView;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }
        
        cell.textLabel.text = @"Event Details";
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    else {
        
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }
        
        DCProject *project = [[event.projects allObjects] objectAtIndex:indexPath.row];
        
        
        // Configure the cell...
        cell.textLabel.text = project.name;
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }

}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        
        SVWebViewController *webViewController = [[SVWebViewController alloc] initWithAddress:event.siteURL];
        [self.navigationController pushViewController:webViewController animated:YES];
        [webViewController release];
    }
    else {
        
        ProjectDetailViewController *projectDetailViewController = [[ProjectDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
        [projectDetailViewController setProject:[[event.projects allObjects] objectAtIndex:indexPath.row]];
        [self.navigationController pushViewController:projectDetailViewController animated:YES];
        [projectDetailViewController release];
    }

}

- (void) addHeaderAndFooter
{
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
    footer.backgroundColor = [UIColor clearColor];
    
    //[self.tableView setTableHeaderView:header];
    [self.tableView setTableFooterView:footer];
    [footer release];
}

@end
