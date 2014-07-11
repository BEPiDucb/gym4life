//
//  G4LAppDelegate.m
//  gym4life
//
//  Created by willie santos on 29/05/14.
//  Copyright (c) 2014 willie santos. All rights reserved.
//

#import "G4LAppDelegate.h"
#import "G4LViewPrincipal.h"

@implementation G4LAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    
    G4LViewPrincipal *view = [[G4LViewPrincipal alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:view];

    
    [nav.navigationBar setBackgroundColor:[UIColor colorWithRed:251.f/255.f green:220.f/255.f blue:95.f/255.f alpha:1.f]];
    
    //amarelo: R 251 G 220 B 95
    
    self.window.rootViewController = nav;
    
    
    
    
    
    //pega a serie escolhida pelo usuario
    NSMutableArray *numSerieEscolhida=[[NSMutableArray alloc] initWithContentsOfFile:
                                       [[NSBundle mainBundle] pathForResource:@"numeroSerieEscolhida" ofType:@"plist"]];
    
    //Se nao existir nenhum escolhido a serie 1 é definida como padrao
    if ([numSerieEscolhida count]==0)
    {
        [numSerieEscolhida addObject:@01];
        
        [numSerieEscolhida writeToFile:[[NSBundle mainBundle] pathForResource:@"numeroSerieEscolhida" ofType:@"plist"] atomically:YES];
        
        NSLog(@" Entrei no if");
    }

    [self.window addSubview:nav.view];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
