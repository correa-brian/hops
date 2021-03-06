//
//  AppDelegate.swift
//  Hops
//
//  Created by Brian Correa on 11/13/16.
//  Copyright © 2016 milkshake. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let welcomeVc = HPWelcomeViewController()
        let navCtr = UINavigationController(rootViewController: welcomeVc)
        
//        let homeVc = HPHomeViewController()
//        homeVc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "profile_icon"), tag: 0)
//        
//        let mapVc =  HPMapViewController()
//        mapVc.tabBarItem = UITabBarItem(title: "Recs", image: UIImage(named:"globe-icon"), tag: 1)
//
//        let controllers = [homeVc, mapVc]
//        
//        let tabCtr = UITabBarController()
//        tabCtr.viewControllers = controllers
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navCtr
        
        self.checkCurrentUser()
        self.window?.makeKeyAndVisible()
        return true
    }
    
    func checkCurrentUser(){
        print("checkCurrentUser")
        
        APIManager.checkCurrentUser { response in
            if let currentUserInfo = response["user"] as? Dictionary<String, AnyObject>{
                print("currentUserInfo: \(currentUserInfo)")
                
                let notification = NSNotification(name: NSNotification.Name(rawValue: Constants.kUserLoggedInNotification), object: nil, userInfo: ["user": currentUserInfo])
                
                let notificationCenter = NotificationCenter.default
                notificationCenter.post(notification as Notification)
            }
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

