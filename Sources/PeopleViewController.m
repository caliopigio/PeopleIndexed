#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "PeopleViewController.h"

#import "Person.h"


@implementation PeopleViewController

@synthesize collation;
@synthesize people;
@synthesize peopleSortedArray;
@synthesize filteredArray;
@synthesize searchDisplay;
@synthesize searchBar;

#pragma mark -
#pragma mark NSObject

- (void)dealloc
{
    [super dealloc];
}

#pragma mark -
#pragma mark UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    
    [searchBar setDelegate:self];
    [self.tableView setTableHeaderView:searchBar];
    
    searchDisplay = [[UISearchDisplayController alloc] initWithSearchBar:
            searchBar contentsController:self];
    
    [searchBar release];
    [searchDisplay setDelegate:self];
    [searchDisplay setSearchResultsDelegate:self];
    [searchDisplay setSearchResultsDataSource:self];
    
    self.collation = [UILocalizedIndexedCollation currentCollation];
    NSMutableArray *newPeopleArray = [NSMutableArray arrayWithCapacity:
            [[self.collation sectionTitles] count]];
    self.filteredArray = [NSMutableArray arrayWithCapacity:[self.people count]];
    NSInteger i;
    
    for (i = 0; i < [[self.collation sectionTitles] count]; i++) {
        NSMutableArray *newArray = [[NSMutableArray alloc] init];
        
        [newPeopleArray addObject:newArray];
        [newArray release];
    }
    
    for (Person *person in people) {
        NSInteger sectionNumber = [self.collation sectionForObject:[person name] 
                collationStringSelector:@selector(description)];
                
        [person setSectionNum:sectionNumber];
        [[newPeopleArray objectAtIndex:sectionNumber] addObject:person];
    }
        
    for (i = 0; i <[[self.collation sectionTitles] count]; i++) {
        NSArray *sortedPeopleArray = [self.collation sortedArrayFromArray:
                [newPeopleArray objectAtIndex:i] collationStringSelector:
                    @selector(name)];
                    
        [newPeopleArray replaceObjectAtIndex:i withObject:sortedPeopleArray]; 
    }
    
    self.peopleSortedArray = newPeopleArray;    
}

#pragma mark - 
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return 1;
    }
    return  [self.peopleSortedArray count];
}

- (NSInteger)       tableView:(UITableView *)tableView 
        numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.filteredArray count];
    }
    return [[self.peopleSortedArray objectAtIndex:section] count];
}

- (UITableViewCell *)   tableView:(UITableView *)tableView 
            cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
            CellIdentifier];
            
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] 
                    autorelease];
    }
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [[self.filteredArray objectAtIndex:
                indexPath.row] name];
    } else {
        cell.textLabel.text = [[[self.peopleSortedArray objectAtIndex:
                indexPath.section] objectAtIndex:indexPath.row] name];
    }
    return cell;
}

- (NSString *)      tableView:(UITableView *)tableView 
      titleForHeaderInSection:(NSInteger)section 
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return nil;
    }
    if ([[self.peopleSortedArray objectAtIndex:section] count] == 0) {
        return nil;
    }
    return [[self.collation sectionTitles] objectAtIndex:section];
}

- (NSInteger)       tableView:(UITableView *)tableView 
  sectionForSectionIndexTitle:(NSString *)title 
                      atIndex:(NSInteger)index 
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return 0;
    }
    return [self.collation sectionForSectionIndexTitleAtIndex:index];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView 
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return nil;
    }
    return [self.collation sectionIndexTitles];
}


#pragma mark - 
#pragma mark <UITableViewDelegate>

- (void)        tableView:(UITableView *)tableView 
  didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark <UISearchDisplayDelegate>

- (BOOL)        searchDisplayController:(UISearchDisplayController *)controller
       shouldReloadTableForSearchString:(NSString *)searchString
{
    [self.filteredArray removeAllObjects];
    
    NSArray *peopleSorted = [self.collation sortedArrayFromArray:people 
            collationStringSelector:@selector(name)];
    
    for (Person *person in peopleSorted) {
        NSComparisonResult result = [person.name compare:searchString
                options:(NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch) 
                    range:NSMakeRange(0, [searchString length])];
        if (result == NSOrderedSame) {
            [self.filteredArray addObject:person];
        }
    }
    return YES;
}

@end
