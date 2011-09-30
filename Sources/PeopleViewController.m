#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "PeopleViewController.h"

#import "Person.h"


@implementation PeopleViewController

@synthesize collation = _collation;
@synthesize people = _people;
@synthesize peopleSortedArray = _peopleSortedArray;
@synthesize filteredArray = _filteredArray;
@synthesize searchDisplay = _searchDisplay;

#pragma mark -
#pragma mark NSObject

- (void)dealloc
{
    [_collation release];
    [_people release];
    [_peopleSortedArray release];
    [_filteredArray release];
    [_searchDisplay release];
    [super dealloc];
}

#pragma mark -
#pragma mark UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UISearchBar *searchBar = [[[UISearchBar alloc] initWithFrame:
            CGRectMake(0, 0, 320, 44)] autorelease];
    
    [[self tableView] setTableHeaderView:searchBar];
    [self setSearchDisplay:[[UISearchDisplayController alloc] initWithSearchBar:
            searchBar contentsController:self]];
    [_searchDisplay setDelegate:self];
    [_searchDisplay setSearchResultsDelegate:self];
    [_searchDisplay setSearchResultsDataSource:self];
    [self setCollation:[UILocalizedIndexedCollation currentCollation]];
    
    NSMutableArray *newPeopleArray = [NSMutableArray arrayWithCapacity:
            [[_collation sectionTitles] count]];
    
    [self setFilteredArray:[NSArray array]];
    
    NSInteger i;
    
    for (i = 0; i < [[_collation sectionTitles] count]; i++) {
        NSMutableArray *newArray = [[[NSMutableArray alloc] init] autorelease];
        
        [newPeopleArray addObject:newArray];
    }
    for (Person *person in _people) {
        NSInteger sectionNumber = [_collation sectionForObject:
                [person name] collationStringSelector:@selector(description)];
                
        [person setSectionNum:sectionNumber];
        [[newPeopleArray objectAtIndex:sectionNumber] addObject:person];
    }
    for (i = 0; i <[[_collation sectionTitles] count]; i++) {
        NSArray *sortedPeopleArray = [_collation sortedArrayFromArray:
                [newPeopleArray objectAtIndex:i] collationStringSelector:
                    @selector(name)];
                    
        [newPeopleArray replaceObjectAtIndex:i withObject:sortedPeopleArray]; 
    }
    [self setPeopleSortedArray:newPeopleArray];  
}

#pragma mark -
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == [[self searchDisplayController] searchResultsTableView])
        return 1;
    return  [_peopleSortedArray count];
}

- (NSInteger)       tableView:(UITableView *)tableView 
        numberOfRowsInSection:(NSInteger)section
{
    if (tableView == [[self searchDisplayController] searchResultsTableView])
        return [_filteredArray count];
    return [[_peopleSortedArray objectAtIndex:section] count];
}

- (UITableViewCell *)   tableView:(UITableView *)tableView 
            cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
            CellIdentifier];
            
    if (cell == nil)
        cell = [[[UITableViewCell alloc] initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] 
                    autorelease];
    if (tableView == [[self searchDisplayController] searchResultsTableView]) {
        [[cell textLabel] setText:[[_filteredArray objectAtIndex:
                [indexPath row]] name]];
    } else {        
        NSArray *section = [_peopleSortedArray objectAtIndex:
                [indexPath section]];
        
        [[cell textLabel] setText:[[section objectAtIndex:
                [indexPath row]] name]];
    }
    return cell;
}

- (NSString *)      tableView:(UITableView *)tableView 
      titleForHeaderInSection:(NSInteger)section 
{
    if (tableView == [[self searchDisplayController] searchResultsTableView])
        return nil;
    if ([[_peopleSortedArray objectAtIndex:section] count] == 0)
        return nil;
    return [[_collation sectionTitles] objectAtIndex:section];
}

- (NSInteger)       tableView:(UITableView *)tableView 
  sectionForSectionIndexTitle:(NSString *)title 
                      atIndex:(NSInteger)index 
{
    if (tableView == [[self searchDisplayController] searchResultsTableView])
        return 0;
    if ([title isEqualToString:UITableViewIndexSearch]) {
        [[self tableView] setContentOffset:CGPointMake(0, 0) animated:YES];
        return -1;
    }
    return [_collation sectionForSectionIndexTitleAtIndex:(index - 1)];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView 
{
    if (tableView == [[self searchDisplayController] searchResultsTableView])
        return nil;

    NSMutableArray *IndexTitles = [NSMutableArray arrayWithObject:
            UITableViewIndexSearch];
    
    [IndexTitles addObjectsFromArray:[_collation sectionIndexTitles]];
    return IndexTitles;
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
    /*
    [_filteredArray removeAllObjects];
    
    NSArray *peopleSorted = [_collation sortedArrayFromArray:_people
            collationStringSelector:@selector(name)];
    
    for (Person *person in peopleSorted) {
        NSComparisonResult result = [[person name] compare:searchString
                options:(NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch)
                    range:NSMakeRange(0, [searchString length])];

        if (result == NSOrderedSame)
            [_filteredArray addObject:person];
    }
    return YES;
    */
    NSPredicate *predicate = [NSPredicate predicateWithFormat:
            @"name contains[cd] %@", searchString];
    NSArray *peopleSorted = [_collation sortedArrayFromArray:_people
            collationStringSelector:@selector(name)];

    [self setFilteredArray:
            [peopleSorted filteredArrayUsingPredicate:predicate]];
    return YES;
}
@end
