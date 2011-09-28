#import <Foundation/Foundation.h>

#define P(x) [Person personWithName:x]

@interface Person: NSObject
{
    NSString *_name;
    NSInteger _sectionNum;
}
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger sectionNum;

+ (id)personWithName:(NSString *)name;
@end
