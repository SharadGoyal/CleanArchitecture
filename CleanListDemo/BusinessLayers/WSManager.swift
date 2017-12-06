//
//  WSManager.swift
//  CleanListDemo
//
//  Created by Sharad Goyal on 03/11/17.
//  Copyright © 2017 Sharad Goyal. All rights reserved.
//

import Foundation
import Alamofire

struct APIStruct {
    let url: String
    let method: HTTPMethod
    let body: [String: Any]?
    let headers: [String: String]?
}

class WSManager {
    
    static let shared = WSManager()
    /*
    private var manager: Alamofire.SessionManager
    private let configuration: URLSessionConfiguration
    
    private init() {
        configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        manager = Alamofire.SessionManager(configuration: configuration)
    }
    
    func getResponse(apiObject: APIStruct, onSuccess: @escaping (_ response: Any) -> Void, onFailure: @escaping (_ error: ErrorModel) -> Void) {
        
        let apiHeaders = apiObject.headers ?? [:]
        let apiBody = apiObject.body ?? nil
        
        guard let url = URL(string: apiObject.url) else {
            return
        }
        
        manager.request(url, method: apiObject.method, parameters: apiBody, encoding: JSONEncoding.default, headers: apiHeaders).validate().responseJSON(completionHandler: { (response) in
            if response.result.isSuccess {
                onSuccess(response.result.value ?? "")
            } else {
                let errorModel: ErrorModel = ErrorManager.processError(error: response.result.error)
                onFailure(errorModel)
            }
        })
    
    }*/
 
    
    /* Response via URLSession */
     
    private var session: URLSession
    private let configuration: URLSessionConfiguration
    
    private init() {
        configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        session = URLSession.init(configuration: configuration)
    }
    
    func getResponse(apiObject: APIStruct, onSuccess: @escaping (_ response: Any) -> Void, onFailure: @escaping (_ error: ErrorModel) -> Void) {
        
        guard let url = URL.init(string: apiObject.url) else {
            return
        }
        let urlRequest = URLRequest.init(url: url)
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            if let err = error {
                let errorModel: ErrorModel = ErrorManager.processError(error: err, errorCode: nil, errorMsg: nil)
                DispatchQueue.main.async {
                    onFailure(errorModel)
                }
                
            } else {
                if let dataReceived = data {
                    let dict = try? JSONSerialization.jsonObject(with: dataReceived, options: JSONSerialization.ReadingOptions.allowFragments)
                    DispatchQueue.main.async {
                        onSuccess(dict as Any)
                    }
                
                }
            }
            
        }
        .resume()
    }
 
}
