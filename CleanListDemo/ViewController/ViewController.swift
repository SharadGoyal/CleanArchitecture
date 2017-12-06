//
//  ViewController.swift
//  CleanListDemo
//
//  Created by Sharad Goyal on 03/11/17.
//  Copyright © 2017 Sharad Goyal. All rights reserved.
//

import UIKit

class ViewController: BaseVC {

    var router: VCRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeVC()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    private func initializeVC() {
        let configurator = VCConfigurator.shared
        configurator.configure(vc: self)
        navigationItem.prompt = "Hello"
        navigationItem.title = "List"
    }

    @IBAction func clickedBtnShowList(_ sender: UIButton) {
        self.router.showListVC()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
