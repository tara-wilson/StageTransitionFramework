//
//  AppDelegate.swift
//  ExampleViewController
//
//  Created by Tara Wilson on 7/10/17.
//  Copyright © 2017 twil. All rights reserved.
//

import UIKit


/////////////////////////////////////////////////////////////////
/*
 
 This is a view controller I put together for a client for an app that displays music events.
 
 The main model is an event object which you can see more information on at the bottom of the file
 
 Most of this VC is related to UI. The event model object already exists when the view is entered, the view's components just need to be displayed in the scrollview
 
 A large part of this vc is using autolayout to display these ui elements - the autolayout was done a bit strangely because the client changed the desired order of the ui elements ALL THE TIME...fun.....
 
 So the vc was done this way to make swapping around items a breeze
 
 I don't use storyboard, all of my ui items and constraints are done programatically
 
 I know there are easier ways to do constraints (I like easypeasy) but when I went to rewrite this VC I knew I needed a code sample so I didn't want to integrate too many libraries.
 
 The app this is used for is in production so to see this in action go to
 https://appsto.re/us/ewUKib.i to download
 
 */
/////////////////////////////////////////////////////////////////

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let vc = ViewController()
       
        let win = UIWindow()
        win.frame = UIScreen.main.bounds
        win.makeKeyAndVisible()
        window = win

        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
        return true
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

