#import <Foundation/Foundation.h>

#import "Person.h"

@implementation Person

#pragma mark -
#pragma mark NSObject

- (void)dealloc
{
    [_name release];
    [super dealloc];
}

#pragma mark -
#pragma mark Person

@synthesize name = _name, sectionNum = _sectionNum;

+ (id)personWithName:(NSString *)name
{
    Person *person = [[[Person alloc] init] autorelease];

    [person setName:name];
    return person;
}
@end
