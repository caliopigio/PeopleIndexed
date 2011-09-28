//
//  PeopleViewController.m
//  PeopleIndexed
//
//  Created by Carlitos Larrañaga Calmet on 28/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PeopleViewController.h"

#import "Person.h"


@implementation PeopleViewController

@synthesize collation;
@synthesize people;
@synthesize peopleSortedArray;
@synthesize indexesArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.collation = [UILocalizedIndexedCollation currentCollation];
    
    NSMutableArray *newPeopleArray = [NSMutableArray arrayWithCapacity:[[self.collation sectionTitles] count]];
    NSInteger i;
    for (i = 0; i < [[self.collation sectionTitles] count]; i++) {
        NSMutableArray *newArray = [[NSMutableArray alloc] init];
        [newPeopleArray addObject:newArray];
        [newArray release];
    }
    
    for (Person *person in people) {
        NSInteger sectionNumber = [self.collation sectionForObject:[person name] collationStringSelector:@selector(description)];
        [person setSectionNum:sectionNumber];
        [[newPeopleArray objectAtIndex:sectionNumber] addObject:person];
    }
        
    for (i = 0; i <[[self.collation sectionTitles] count]; i++) {
        NSArray *sortedPeopleArray = [self.collation sortedArrayFromArray:[newPeopleArray objectAtIndex:i] collationStringSelector:@selector(name)];
        [newPeopleArray replaceObjectAtIndex:i withObject:sortedPeopleArray]; 
    }
    
    self.peopleSortedArray = newPeopleArray;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  [self.peopleSortedArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.peopleSortedArray objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [[[self.peopleSortedArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] name];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section 
{
    if ([[self.peopleSortedArray objectAtIndex:section] count] == 0) {
        return nil;
    }
    return [[self.collation sectionTitles] objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index 
{
    return [self.collation sectionForSectionIndexTitleAtIndex:index];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView 
{
    return [self.collation sectionIndexTitles];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
