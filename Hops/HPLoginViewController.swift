//
//  HPLoginViewController.swift
//  Hops
//
//  Created by Brian Correa on 11/13/16.
//  Copyright © 2016 milkshake. All rights reserved.
//

import UIKit

class HPLoginViewController: HPViewController, UITextFieldDelegate {
    
    var loginFields = [UITextField]()

    override func loadView() {
        let frame = UIScreen.main.bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .darkGray
        
        let width = frame.size.width
        let height = frame.size.height
        
        let cancelBtn = UIButton(type: .custom)
        cancelBtn.frame = CGRect(x: 10, y: 15, width: 32, height: 32)
        cancelBtn.backgroundColor = .orange
        cancelBtn.addTarget(self, action: #selector(HPViewController.exitModal), for: .touchUpInside)
        view.addSubview(cancelBtn)
        
        let loginText = ["Email", "Password"]
        var y = height*0.3
        
        for text in loginText{
            let field = UITextField(frame: CGRect(x: width*0.5-100, y: y, width: 200, height: 50))
            field.placeholder = text
            field.delegate = self
            field.backgroundColor = .white
            field.textColor = .black
            
            let isPassword = (text == "Password")
            field.isSecureTextEntry = (isPassword)
            field.returnKeyType = (isPassword) ? .done : .next
            
            view.addSubview(field)
            self.loginFields.append(field)
            y += field.frame.size.height + 20
        }
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func exitModal() {
        super.exitModal()
        
        for textField in self.loginFields {
            if textField.isFirstResponder {
                textField.resignFirstResponder()
                break
            }
        }
    }
    
    //MARK: TextField Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        let index = self.loginFields.index(of: textField)!
        
        if index == self.loginFields.count-1{
            var missingValue = ""
            var profileInfo = Dictionary<String, AnyObject>()
            
            for field in self.loginFields{
                if field.text?.characters.count == 0{
                    missingValue = field.placeholder!
                    break
                }
                
                print("Missing Value: \(missingValue)")
                profileInfo[field.placeholder!.lowercased()] = field.text! as AnyObject?
            }
            
            if missingValue.characters.count > 0 {
                let msg = "You forgot your "+missingValue
                let alert = UIAlertController(title: "Missing Value", message: msg, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                return true
            }
            
            print("Profile Info: \(profileInfo)")
            self.userLogin(profileInfo: profileInfo)
            return true
        }
        
        
        let nextField = self.loginFields[index+1]
        nextField.becomeFirstResponder()
        return true
    }
    
    func userLogin(profileInfo: Dictionary<String, AnyObject>){
        print("userLogin: \(profileInfo)")
        
        APIManager.postRequest(path: "/user/login", params: profileInfo, completion: { error, response in
            if error != nil {
                let errorObj = error?.userInfo
                let errorMsg = errorObj!["message"] as! String
                
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Message", message: errorMsg, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                return
            }
            
            if let result = response!["currentuser"] as? Dictionary<String, AnyObject>{
                print("Result from API MANAGER: \(result)")
                
                DispatchQueue.main.async {
                    self.postLoggedInNotification(currentUser: result)
                    
                    let homeVc = HPHomeViewController()
                    homeVc.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "profile_icon"), tag: 0)
                    
                    let mapVc =  HPMapViewController()
                    mapVc.tabBarItem = UITabBarItem(title: "Recs", image: UIImage(named:"globe-icon"), tag: 1)
                    
                    let controllers = [homeVc, mapVc]
                    
                    let tabCtr = UITabBarController()
                    tabCtr.viewControllers = controllers
                    
                    self.present(tabCtr, animated: true, completion: nil)
                }
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
