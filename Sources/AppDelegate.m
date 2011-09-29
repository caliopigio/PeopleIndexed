#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "AppDelegate.h"

#import "PeopleViewController.h"
#import "Person.h"

@implementation AppDelegate

#pragma mark -
#pragma mark NSObject

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

#pragma mark -
#pragma mark <UIApplicationDelegate>


- (BOOL)            application:(UIApplication *)application 
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NSMutableArray *people = [NSMutableArray arrayWithObjects:
            P(@"78"), P(@"%"), P(@"Gapatero"), P(@"Huan"), P(@"Jlberto"), 
            P(@"Kedro"), P(@"Lna"), P(@"Ñxl"), P(@"Zosé"), P(@"Capatero"), 
            P(@"Xuan"), P(@"Vlberto"), P(@"Pedro"), P(@"Ana"), P(@"Axl"), 
            P(@"José"),P(@"Qapatero"), P(@"Wuan"), P(@"Elberto"), P(@"Redro"), 
            P(@"Tna"), P(@"Yxl"), P(@"Uosé"), P(@"Iapatero"), P(@"Ouan"), 
            P(@"Plberto"), P(@"Aedro"), P(@"Sna"), P(@"Dxl"), P(@"Fosé"),
            P(@"Gapatero"), P(@"Muan"), P(@"Llberto"), P(@"Ñedro"), P(@"Ona"), 
            P(@"Pxl"), P(@"Gosé"), P(@"Capatero"), P(@"Vuan"), P(@"Qlberto"), 
            P(@"Hedro"), P(@"Xna"), P(@"Yxl"), P(@"Yosé"), P(@"Kapatero"), 
            P(@"Kuan"), P(@"Qlberto"), P(@"Bedro"), P(@"Ina"), P(@"Uxl"), 
            P(@"José"), P(@"Zapatero"), P(@"Juan"), P(@"Alberto"), P(@"Pedro"), 
            P(@"Ana"), P(@"Axl"), P(@"José"), nil];
    
    PeopleViewController *viewcontroller = [[PeopleViewController alloc] 
            initWithStyle:UITableViewStylePlain];
            
    viewcontroller.people = people;
    _window.rootViewController = viewcontroller;
    [viewcontroller release];
    [_window makeKeyAndVisible];
    return YES;
}

@end
