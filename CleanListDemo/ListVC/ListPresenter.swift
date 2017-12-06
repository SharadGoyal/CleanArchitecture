//
//  ListPresenter.swift
//  CleanListDemo
//
//  Created by Sharad Goyal on 03/11/17.
//  Copyright © 2017 Sharad Goyal. All rights reserved.
//

import Foundation

protocol ListPresenterOutput: BasePresenterOutput {
    func listItems(response: MostWatchedItems)
}

class ListPresenter: ListPresenterOutput {
    weak var output: ListVC!
    
    func listItems(response: MostWatchedItems) {
        output.showList(response: response)
    }
    
    func noInternet() {
        output.showErrorView(.noInternet)
    }
    
    func onErrorOccured() {
        
    }
}
