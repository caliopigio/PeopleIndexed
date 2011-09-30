#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PeopleViewController : UITableViewController 
        <UISearchDisplayDelegate>
{
    UILocalizedIndexedCollation *_collation;
    NSArray *_people;
    NSMutableArray *_peopleSortedArray;
    NSArray *_filteredArray;
    UISearchDisplayController *_searchDisplay;
}

@property (nonatomic, retain) UILocalizedIndexedCollation *collation;
@property (nonatomic, retain) NSArray *people;
@property (nonatomic, retain) NSMutableArray *peopleSortedArray;
@property (nonatomic, retain) NSArray *filteredArray;
@property (nonatomic, retain) UISearchDisplayController *searchDisplay;

@end
