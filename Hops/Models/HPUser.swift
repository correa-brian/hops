//
//  HPUser.swift
//  Hops
//
//  Created by Brian Correa on 1/7/17.
//  Copyright © 2017 milkshake. All rights reserved.
//

import UIKit

class HPUser: NSObject {
    
    var id: String?
    var email: String!
    
    func populate(profileInfo: Dictionary<String, AnyObject>){
        let keys = ["id", "email"]
        
        for key in keys {
            let value = profileInfo[key]
            self.setValue(value, forKey: key)
        }
    }
}
