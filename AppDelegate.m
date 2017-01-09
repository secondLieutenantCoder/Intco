//
//  AppDelegate.m
//  intcoTest
//
//  Created by INTCO 王伟 on 2016/10/7.
//  Copyright © 2016年 INTCO 王伟. All rights reserved.
//

#import "AppDelegate.h"
#import "INTCOTBViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*
    //tabbar
    UITabBarController * tabBarVC = [[UITabBarController alloc] init];
    
    UIViewController * aVC = [[UIViewController alloc] init];
    aVC.view.backgroundColor = [UIColor redColor];
    
    UIViewController * bVC = [[UIViewController alloc] init];
    bVC.view.backgroundColor = [UIColor orangeColor];
    
    UIViewController * cVC = [[UIViewController alloc] init];
    cVC.view.backgroundColor = [UIColor yellowColor];
    
    UIViewController * dVC = [[UIViewController alloc] init];
    dVC.view.backgroundColor = [UIColor greenColor];
    
    UIViewController * eVC = [[UIViewController alloc] init];
    eVC.view.backgroundColor = [UIColor blueColor];
    
    UIViewController * fVC = [[UIViewController alloc] init];
    fVC.view.backgroundColor = [UIColor cyanColor];
    
    UIViewController * gVC = [[UIViewController alloc] init];
    gVC.view.backgroundColor = [UIColor purpleColor];
    
    UIViewController * hVC = [[UIViewController alloc] init];
    hVC.view.backgroundColor = [UIColor grayColor];
    
    UIViewController * iVC = [[UIViewController alloc] init];
    iVC.view.backgroundColor = [UIColor magentaColor];
    
    UIViewController * jVC = [[UIViewController alloc] init];
    jVC.view.backgroundColor = [UIColor lightGrayColor];
    //pad tabbar可以放8个item
    [tabBarVC setViewControllers:@[aVC,bVC,cVC,dVC,eVC,fVC,gVC,hVC,iVC]];
    
    self.window.rootViewController = tabBarVC;
     */
    
    INTCOTBViewController * rootTB = [[INTCOTBViewController alloc] init];
    
    self.window.rootViewController = rootTB;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
