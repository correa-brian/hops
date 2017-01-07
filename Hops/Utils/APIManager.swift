//
//  APIManager.swift
//  Hops
//
//  Created by Brian Correa on 1/7/17.
//  Copyright © 2017 milkshake. All rights reserved.
//

import UIKit
import Alamofire

class APIManager: NSObject {
    
    static func postRequest(path:String, params: Dictionary<String, AnyObject>?, completion:((_ error: NSError?, _ results: Dictionary<String, AnyObject>?) -> Void)?){
        
        let url = Constants.baseUrl+path
        
        Alamofire.request(url, method: .post, parameters: params).responseJSON { response in
            if let json = response.result.value as? Dictionary<String, AnyObject>{
                if completion != nil {
                    if completion == nil{
                        return
                    }
                    
                    if let confirmation = json["confirmation"] as? String {
                        if confirmation == "Success"{
                            completion!(nil, json)
                        }
                        else{
                            let msg = json["message"] as! String
                            let err = NSError(domain: "", code: 0, userInfo: ["message":msg])
                            completion!(err, nil)
                        }
                    }
                }
            }
        }
    }
}
