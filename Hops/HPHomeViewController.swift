//
//  HPHomeViewController.swift
//  Hops
//
//  Created by Brian Correa on 11/20/16.
//  Copyright © 2016 milkshake. All rights reserved.
//

import UIKit

class HPHomeViewController: HPViewController {
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func loadView(){
        self.edgesForExtendedLayout = []
        
        let frame = UIScreen.main.bounds
        let view = UIView(frame: frame)
        view.backgroundColor = .red
        
        let height = frame.size.height
        let width = frame.size.width
        
        let dimen = height * 0.25
        
        let topContainer = UIView(frame: CGRect(x: 0, y: 0, width: width, height: dimen))
        topContainer.backgroundColor = .blue
        view.addSubview(topContainer)
        
        let bottomContainer = UIView(frame: CGRect(x: 0, y: topContainer.frame.size.height, width: width, height: height*0.75))
        bottomContainer.backgroundColor = .yellow
        view.addSubview(bottomContainer)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Current user in ViewDidLoad: \(HPViewController.currentUser.email)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
