//
//  VCRouter.swift
//  CleanListDemo
//
//  Created by Sharad Goyal on 03/11/17.
//  Copyright © 2017 Sharad Goyal. All rights reserved.
//

import Foundation

protocol VCRouterInput {
    func showListVC()
}

class VCRouter: VCRouterInput {
    weak var vc: ViewController!
    
    func showListVC() {
        let listVC = vc.storyboard?.instantiateViewController(withIdentifier: "ListVC") as! ListVC
        vc.navigationController?.pushViewController(listVC, animated: true)
    }
}
