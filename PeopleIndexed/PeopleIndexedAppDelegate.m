//
//  PeopleIndexedAppDelegate.m
//  PeopleIndexed
//
//  Created by Carlitos Larrañaga Calmet on 28/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PeopleIndexedAppDelegate.h"

#import "PeopleViewController.h"
#import "Person.h"

@implementation PeopleIndexedAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSMutableArray *people = [NSMutableArray arrayWithObjects:P(@"78"), P(@"%"), P(@"Gapatero"), P(@"Huan"), P(@"Jlberto"), P(@"Kedro"), P(@"Lna"), P(@"Ñxl"), P(@"Zosé"), P(@"Capatero"), P(@"Xuan"), P(@"Vlberto"), P(@"Pedro"), P(@"Ana"), P(@"Axl"), P(@"José"),P(@"Qapatero"), P(@"Wuan"), P(@"Elberto"), P(@"Redro"), P(@"Tna"), P(@"Yxl"), P(@"Uosé"), P(@"Iapatero"), P(@"Ouan"), P(@"Plberto"), P(@"Aedro"), P(@"Sna"), P(@"Dxl"), P(@"Fosé"),P(@"Gapatero"), P(@"Muan"), P(@"Llberto"), P(@"Ñedro"), P(@"Ona"), P(@"Pxl"), P(@"Gosé"), P(@"Capatero"), P(@"Vuan"), P(@"Qlberto"), P(@"Hedro"), P(@"Xna"), P(@"Yxl"), P(@"Yosé"), P(@"Kapatero"), P(@"Kuan"), P(@"Qlberto"), P(@"Bedro"), P(@"Ina"), P(@"Uxl"), P(@"José"), P(@"Zapatero"), P(@"Juan"), P(@"Alberto"), P(@"Pedro"), P(@"Ana"), P(@"Axl"), P(@"José"), nil];
    
    PeopleViewController *viewcontroller = [[PeopleViewController alloc] initWithStyle:UITableViewStylePlain];
    viewcontroller.people = people;
    _window.rootViewController = viewcontroller;
    [viewcontroller release];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
