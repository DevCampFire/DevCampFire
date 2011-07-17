//
//  ProjectDetailViewController.m
//  DevCampFire
//
//  Created by Samuel Tremblay on 7/16/11.
//  Copyright 2011 Nurun Inc. All rights reserved.
//

#import "ProjectDetailViewController.h"
#import "ParticipantDetailViewController.h"
#import "DCParticipant.h"

#define FONT_SIZE 16.0f
#define CELL_CONTENT_WIDTH 700.0f
#define CELL_CONTENT_MARGIN 0.0f
#define CONSTANT_CONTENT_SIZE 0.0f

@implementation ProjectDetailViewController

@synthesize project;

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self addHeaderAndFooter];
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
        // Return the number of rows in the section.
        return [[project.participants allObjects] count];
    }

}

-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat cheight = 0;
    
    if (indexPath.section == 0) {
        
        NSString *text = project.detail;
        //NSLog(@"%@", text);
        
        CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
        
        CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
        
        CGFloat height = MAX(size.height, 44.0f);
        
        cheight = height + (CELL_CONTENT_MARGIN * 2) + CONSTANT_CONTENT_SIZE;
        //NSLog(@"%f", height);
    }
    if (indexPath.section == 1) {
        cheight = 50;
    }
    
    return cheight;
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
        title.text = @"Project Details";
    }
    if (section == 1) {
        title.text = @"Participants";
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

        UIView *backView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
        backView.backgroundColor = [UIColor clearColor];
        cell.backgroundView = backView;
        
        UILabel *review = [[UILabel alloc] initWithFrame:CGRectZero];
        review.backgroundColor = [UIColor clearColor];
        [review setLineBreakMode:UILineBreakModeTailTruncation];
        [review setMinimumFontSize:FONT_SIZE];
        [review setNumberOfLines:0];
        [review setFont:[UIFont systemFontOfSize:FONT_SIZE]];
        [review setTag:1];
        
        //[[review layer] setBorderWidth:2.0f];
        
        [[cell contentView] addSubview:review];
        
        NSString *text = project.detail;
        
        CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), 20000.0f);
        
        CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:FONT_SIZE] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
        
        if (!review)
            review = (UILabel*)[cell viewWithTag:1];
        
        [review setText:text];
        [review setFrame:CGRectMake(CELL_CONTENT_MARGIN, CELL_CONTENT_MARGIN + CONSTANT_CONTENT_SIZE, CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2), MAX(size.height, 44.0f))];
        [review release];
        review = nil;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
        
        return cell;
    }
    else {
        
        static NSString *CellIdentifier = @"Cell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        }
        
        // Configure the cell...
        
        DCParticipant *participant = [[project.participants allObjects] objectAtIndex:indexPath.row];
        
        // Configure the cell...
        cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", participant.firstName, participant.lastName];
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
        
    }
    else {
        
    }
}

- (void) addHeaderAndFooter
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, -20)];
    header.backgroundColor = [UIColor clearColor];
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    footer.backgroundColor = [UIColor clearColor];
    
    UILabel *tags = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, self.view.bounds.size.width-80, 20)];
    tags.textColor = [UIColor grayColor];
    tags.backgroundColor = [UIColor clearColor];
    tags.text = project.tags;
    [footer addSubview:tags];
    
    
    //[self.tableView setTableHeaderView:header];
    [self.tableView setTableFooterView:footer];
    [header release];
    [footer release];
}

@end
