//
//  AppDelegate.m
//  Koers
//
//  Created by Jeroen Dunselman on 23/09/16.
//  Copyright © 2016 Jeroen Dunselman. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import "SRDKoersViewController.h"
#import "SRDConversie.h"
#import "SRDInfo.h"
#import "SRDKoersTVC.h"
#import "SRDConversieTVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self makeTabs];
    self.window.rootViewController = self.tabBarController;
    [self.tabBarController setDelegate:self];
    
    return YES;
}

-(void) makeTabs{
    self.tabBarController = [[TabBarController alloc] init];
//    Hierbij de kleuren:
//    Kleur Groen: #97ba6a
//    Kleur Blauw Dollar: #004358
//    Kleur Oranje Euro: #fd7400
    UIColor *colorHome = [UIColor colorWithRed:151.0f/255.0f green:186.0f/255.0f blue:106.0f/255.0f alpha:1.0f];
    
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBarTintColor:colorHome];
    
//    SRDKoersTVC *test = [[SRDKoersTVC alloc] init];
//    test.vcTypeStraatOfBank = @"straat";
//    SRDKoersTVC *bank = [[SRDKoersTVC alloc] init];
//    bank.vcTypeStraatOfBank = @"bank";
//
//    SRDConversieTVC *test = [[SRDConversieTVC alloc] init] ;
//    SRDConversie *test = [[SRDConversie alloc] init] ;
    SRDKoersViewController *straat = [[SRDKoersViewController alloc] initWithNibName:@"SRDKoersViewController" bundle:nil];
    straat.vcTypeBankOfSTraat = @"straat";
    SRDKoersViewController *bank = [[SRDKoersViewController alloc] initWithNibName:@"SRDKoersViewController" bundle:nil];
    bank.vcTypeBankOfSTraat = @"bank";
    SRDConversie *conversie = [[SRDConversie alloc] init] ;
//    [[SRDConversieTVC alloc] init] ;
    SRDInfo *info = [[SRDInfo alloc] initWithNibName:@"SRDInfo" bundle:nil];

    self.tabBarController.viewControllers = [NSArray arrayWithObjects:
//                                             test,
                                             straat, bank, conversie, info, nil];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
