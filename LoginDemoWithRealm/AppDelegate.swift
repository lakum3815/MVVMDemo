//
//  AppDelegate.swift
//  LoginDemoWithRealm
//
//  Created by lakum vishal on 30/11/18.
//  Copyright © 2018 lakum vishalbhai rajeshbhai. All rights reserved.
//

import UIKit
import SDWebImage
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var rootViewController:UINavigationController = UINavigationController()
    
    class func shared() -> (AppDelegate)
    {
        let sharedinstance = UIApplication.shared.delegate as! AppDelegate
        return sharedinstance
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.launchAppWithScree()
        // Override point for customization after application launch.
        return true
    }
    
    func launchAppWithScree()
    {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        self.window?.makeKeyAndVisible()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let VC = storyboard.instantiateViewController(withIdentifier: "SplashVC") as! SplashVC
        
        rootViewController.viewControllers = [VC]
        
        rootViewController.navigationBar.isHidden = true
        
        self.window?.rootViewController = rootViewController
        
        self.window!.autoresizesSubviews = true
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
    
    //MARK:- DTAlertView
    
    func showSimpleAlert(_ title: String, message : String){
        AppDelegate.shared().HideSpinnerView()
        
        if message.isNull == false
        {
            let alertView = DTAlertView.init(block: { (alert, buttonIndex, cancelButtonIndex) in
                debugPrint(buttonIndex)
                debugPrint(cancelButtonIndex)
            }, title: title, message: message, cancelButtonTitle: "OK", positiveButtonTitle: nil)
            alertView?.show()
        }
    }
    
    func showAlertWithAction( title: String, message : String, completion: @escaping( _ success: Bool) -> Void)
    {
        AppDelegate.shared().HideSpinnerView()
        
        if message.isNull == false
        {
            let alertView = DTAlertView.init(block: { (alert, buttonIndex, cancelButtonIndex) in
                debugPrint(buttonIndex)
                debugPrint(cancelButtonIndex)
                
                completion(true)
                
            }, title: title, message: message, cancelButtonTitle: "OK", positiveButtonTitle: nil)
            alertView?.show()
        }
    }
    
    //MARK:- SK Activity Indicator
    
    func ShowSpinnerView()
    {
        SKActivityIndicator.spinnerStyle(.spinningFadeCircle)
        SKActivityIndicator.show("", userInteractionStatus: false)
    }
    
    func HideSpinnerView()
    {
        SKActivityIndicator.dismiss()
    }


}

