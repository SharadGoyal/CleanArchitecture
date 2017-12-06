//
//  ListConfigurator.swift
//  CleanListDemo
//
//  Created by Sharad Goyal on 03/11/17.
//  Copyright © 2017 Sharad Goyal. All rights reserved.
//

import Foundation

class ListConfigurator {
    static let shared = ListConfigurator()
    
    private init() {}
    
    func configure(vc: ListVC) {
        let presenter = ListPresenter()
        presenter.output = vc
        
        let interacter = ListInteracter()
        interacter.presenter = presenter
        
        vc.interacter = interacter
    }
}
