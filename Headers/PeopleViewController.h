#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PeopleViewController : UITableViewController <UISearchBarDelegate,
        UISearchDisplayDelegate, UITableViewDataSource, UITableViewDelegate>
{
    UILocalizedIndexedCollation *collation;
    NSArray *people;
    NSMutableArray *peopleSortedArray;
    NSMutableArray *filteredArray;
    UISearchDisplayController *searchDisplay;
    UISearchBar *searchBar;
}

@property (nonatomic, retain) UILocalizedIndexedCollation *collation;
@property (nonatomic, retain) NSArray *people;
@property (nonatomic, retain) NSMutableArray *peopleSortedArray;
@property (nonatomic, retain) NSMutableArray *filteredArray;
@property (nonatomic, retain) UISearchDisplayController *searchDisplay;
@property (nonatomic, retain) UISearchBar *searchBar;

@end
