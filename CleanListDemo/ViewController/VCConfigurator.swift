//
//  VCConfigurator.swift
//  CleanListDemo
//
//  Created by Sharad Goyal on 03/11/17.
//  Copyright © 2017 Sharad Goyal. All rights reserved.
//

import Foundation

class VCConfigurator {
    static let shared = VCConfigurator()
    
    private init() {}
    
    func configure(vc: ViewController) {
        let router = VCRouter()
        router.vc = vc
        
        vc.router = router
    }
}
