//
//  ListWorker.swift
//  CleanListDemo
//
//  Created by Sharad Goyal on 03/11/17.
//  Copyright © 2017 Sharad Goyal. All rights reserved.
//

import Foundation
import JSONParserSwift

class ListWorker {
    
    func getListItems(onSuccess: @escaping (_ response: MostWatchedItems) -> Void, onFailure: @escaping (_ error: ErrorModel) -> Void) {
        
        let apiObj = APIStruct.init(url: "http://svcs.ebay.com/MerchandisingService?OPERATION-NAME=getMostWatchedItems&SERVICE-NAME=MerchandisingService&SERVICE-VERSION=1.1.0&CONSUMER-ID=FandyGot-ec13-4906-b11c-94d9e36684ee&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&maxResults=50", method: .get, body: nil, headers: nil)
        
        WSManager.shared.getResponse(apiObject: apiObj, onSuccess: { (response) in
            
            if let res = response as? [String: Any] {
                let obj: MostWatchedItems = JSONParserSwift.parse(dictionary: res)
                onSuccess(obj)
            }
            
            
        }) { (error) in
            print("error ListWorker failure...")
        }
    }
}
