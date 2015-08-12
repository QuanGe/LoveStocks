//
//  AppDelegate.swift
//  LoveStocks
//
//  Created by zhangruquan on 15/8/12.
//  Copyright (c) 2015年 net.csdn. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UITabBarControllerDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?
    var tabBarController: UITabBarController?
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        if let window = window {
            window.backgroundColor = UIColor.whiteColor()
            
            var homeTabBarController = UITabBarController()
            homeTabBarController.delegate = self;
            var titleArray = ["自选股","资讯"]
            var classArray = ["LSMainViewController","LSNewsViewController"]
            var childControllers = NSMutableArray()
            for i in 0..<2 {
                
                let className = "LoveStocks."+classArray[i]
            
                if let theClass = NSClassFromString(className) as? UIViewController.Type {
                    let childViewController = theClass()
                    
                    childViewController.title=titleArray[i]
                    childViewController.view.backgroundColor = UIColor.whiteColor()
                    childViewController.automaticallyAdjustsScrollViewInsets = false
                    
                    var navController = UINavigationController(rootViewController: childViewController)
                    
                    childControllers.addObject(navController)
                }
                
               
                
            }
            
            homeTabBarController.viewControllers = childControllers as [AnyObject]
            self.navigationController?.navigationBarHidden = true
            window.rootViewController = homeTabBarController
            window.makeKeyAndVisible()
            
        }
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

