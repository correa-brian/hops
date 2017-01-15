//
//  HPViewController.swift
//  Hops
//
//  Created by Brian Correa on 11/13/16.
//  Copyright © 2016 milkshake. All rights reserved.
//

import UIKit

class HPViewController: UIViewController {
    
    static var currentUser = HPUser()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,
                                       selector: #selector(HPViewController.userLoggedIn(notification:)),
                                       name: NSNotification.Name(rawValue: Constants.kUserLoggedInNotification),
                                       object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("BASE User: \(HPViewController.currentUser.email)")
    }
    
    func exitModal(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func postLoggedInNotification(currentUser: Dictionary<String, AnyObject>){
        print("postLoggedInNotification: \(currentUser)")
        let notification = NSNotification(name: NSNotification.Name(rawValue: Constants.kUserLoggedInNotification), object: nil, userInfo: ["user": currentUser])
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.post(notification as Notification)
    }
    
    func userLoggedIn(notification: NSNotification){
        print("userLoggedIn Notification: \(notification)")
        if let user = notification.userInfo!["user"] as? Dictionary<String, AnyObject>{
            print("Line 50 in baseClass: \(user)")
            HPViewController.currentUser.populate(profileInfo: user)
        }
        print("Current user: \(HPViewController.currentUser.email)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
