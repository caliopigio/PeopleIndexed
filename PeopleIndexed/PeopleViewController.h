//
//  PeopleViewController.h
//  PeopleIndexed
//
//  Created by Carlitos Larrañaga Calmet on 28/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleViewController : UITableViewController
{
    UILocalizedIndexedCollation *collation;
    NSArray *people;
    NSMutableArray *peopleSortedArray;
    NSMutableArray *indexesArray;
}

@property (nonatomic, retain) UILocalizedIndexedCollation *collation;
@property (nonatomic, retain) NSArray *people;
@property (nonatomic, retain) NSMutableArray *peopleSortedArray;
@property (nonatomic, retain) NSMutableArray *indexesArray;

@end
