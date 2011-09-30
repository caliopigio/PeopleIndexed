#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PeopleViewController : UITableViewController 
        <UISearchDisplayDelegate>
{
    UILocalizedIndexedCollation *collation;
    NSArray *people;
    NSMutableArray *peopleSortedArray;
    NSMutableArray *filteredArray;
    UISearchDisplayController *searchDisplay;
}

@property (nonatomic, retain) UILocalizedIndexedCollation *collation;
@property (nonatomic, retain) NSArray *people;
@property (nonatomic, retain) NSMutableArray *peopleSortedArray;
@property (nonatomic, retain) NSMutableArray *filteredArray;
@property (nonatomic, retain) UISearchDisplayController *searchDisplay;

@end
