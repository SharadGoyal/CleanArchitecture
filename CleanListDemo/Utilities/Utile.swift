//
//  Utile.swift
//  CleanListDemo
//
//  Created by Sharad Goyal on 07/11/17.
//  Copyright © 2017 Sharad Goyal. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

struct Utile {
    static let activityIndicator = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    
    static func appDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    static func showIndicator() {
        
        let appWindow: UIWindow? = appDelegate().window
        activityIndicator.startAnimating()
        activityIndicator.color = UIColor.gray
        appWindow?.alpha = 0.9
        appWindow?.addSubview(activityIndicator)
        appWindow?.isUserInteractionEnabled = false
        if let center = appWindow?.center {
            activityIndicator.center = center
        }
    }
    
    static func hideIndicator() {
        let appWindow: UIWindow? = appDelegate().window
        appWindow?.isUserInteractionEnabled = true
        appWindow?.alpha = 1.0
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
    
    static func isInternetAvailable() -> Bool {
        guard let reachable = NetworkReachabilityManager()?.isReachable else {
            return false
        }
        if reachable {
            return true
        } else {
            return false
        }
    }
}
