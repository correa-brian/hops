//
//  HPSignUpViewController.swift
//  Hops
//
//  Created by Brian Correa on 11/13/16.
//  Copyright © 2016 milkshake. All rights reserved.
//

import UIKit

class HPSignUpViewController: HPViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let frame = UIScreen.main.bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .green
        
        self.view = view
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
