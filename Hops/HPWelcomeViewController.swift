//
//  HPWelcomeViewController.swift
//  Hops
//
//  Created by Brian Correa on 11/13/16.
//  Copyright © 2016 milkshake. All rights reserved.
//

import UIKit

class HPWelcomeViewController: HPViewController {
    
    var appLabel: UILabel!
    var signUpBtns = [UIButton]()

    override func loadView() {
        let frame = UIScreen.main.bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor(red: 71/255, green: 41/255, blue: 0/255, alpha: 1)
        
        let height = frame.size.height
        let width = frame.size.width

        let w = CGFloat(200)
        let h = CGFloat(50)
        let originX = width*0.5-100
        
        
        self.appLabel = UILabel(frame: CGRect(x: originX, y: height*0.20, width: w, height: h))
        self.appLabel.text = "HOPS"
        self.appLabel.textAlignment = .center
        self.appLabel.font = UIFont(name: "AppleColorEmoji", size: 32)
        self.appLabel.textColor = UIColor(red: 241/255, green: 215/255, blue: 68/255, alpha: 1)
        view.addSubview(self.appLabel)
        
        let signUpText = ["Login", "Signup"]
        var y = self.appLabel.frame.size.height + 200
        
        for buttonText in signUpText{
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: originX, y: y, width: w, height: h)
            button.backgroundColor = UIColor(red: 241/255, green: 215/255, blue: 68/255, alpha: 1)
            button.setTitle(buttonText, for: .normal)
            button.layer.cornerRadius = 5
            button.setTitleColor(UIColor(red: 71/255, green: 41/255, blue: 0/255, alpha: 1), for: .normal)
            button.addTarget(self, action: #selector(HPWelcomeViewController.showNextScreen(sender:)), for: .touchUpInside)

            view.addSubview(button)
            self.signUpBtns.append(button)
            y += 100
        }
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func showNextScreen(sender: UIButton){
        print("showNextScreen: \(sender.titleLabel?.text)")
        
        if sender.titleLabel?.text == "Login" {
            let loginVc = HPLoginViewController()
            self.present(loginVc, animated: true, completion: nil)
        }
        if sender.titleLabel?.text == "Signup" {
            let signUpVc = HPSignUpViewController()
            self.present(signUpVc, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
