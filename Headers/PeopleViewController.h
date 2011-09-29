#import <UIKit/UIKit.h>

@interface PeopleViewController : UITableViewController
{
    UILocalizedIndexedCollation *collation;
    NSArray *people;
    NSMutableArray *peopleSortedArray;
}

@property (nonatomic, retain) UILocalizedIndexedCollation *collation;
@property (nonatomic, retain) NSArray *people;
@property (nonatomic, retain) NSMutableArray *peopleSortedArray;

@end
