//
//  ListInteracter.swift
//  CleanListDemo
//
//  Created by Sharad Goyal on 03/11/17.
//  Copyright © 2017 Sharad Goyal. All rights reserved.
//

import Foundation

protocol ListInteracterInput {
    func fetchItems()
}

protocol ListInteracterOutput {
    func presentFetchedItems(response: MostWatchedItems)
}

class ListInteracter: ListInteracterInput, ListInteracterOutput {
    
    var presenter: ListPresenter!
    var worker: ListWorker!
    
    func fetchItems() {
        if Utile.isInternetAvailable() {
            worker = ListWorker()
            worker.getListItems(onSuccess: { (response) in
                self.presentFetchedItems(response: response)
            }) { (error) in
                print("failure ListInteracter...")
            }
        } else {
            presenter.noInternet()
        }
        
        
    }
    
    func presentFetchedItems(response: MostWatchedItems) {
        presenter.listItems(response: response)
    }
}

