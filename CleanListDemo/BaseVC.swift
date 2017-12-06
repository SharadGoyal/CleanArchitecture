//
//  BaseVC.swift
//  CleanListDemo
//
//  Created by Sharad Goyal on 03/11/17.
//  Copyright © 2017 Sharad Goyal. All rights reserved.
//

import UIKit

private let errorViewTag = 403

class BaseVC: UIViewController, ErrorViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK:- Error View Methods
    /**
     * this method is used to add errorView on viewController
     - params :
     - viewVontroller: it must conform to protocol ErrorViewDelegate
     - errorType: it can be noInternet, noData, serverFailure
     - errorMessage: it is optional we can pass nil also
     */
    func showErrorView(_ errorType:ErrorType, errorImage:UIImage? = nil, errorMessage:String? = nil, backgroundColor: UIColor? = nil) {
        
        Utile.hideIndicator()
        
        let errorView = ErrorView().getErrorView(errorType, errorImage:errorImage, errorMessage:errorMessage)
        errorView.errorViewDelegate = self
        errorView.tag = errorViewTag
        
        if let color = backgroundColor {
            errorView.backgroundColor = color
            errorView.labelError.textColor = .white
        }
        
        view.addSubview(errorView)
        addConstraintForErrorView(view: errorView)
    }

    // method to remove errorView
    func removeErrorView() {
        if let errorView = self.view.viewWithTag(errorViewTag) {
            
            errorView.removeFromSuperview()
        }
    }
    
    // MARK:- ErrorViewDelegate
    func retryBtnClickedOnErrorView() {
        
    }
    
    private func addConstraintForErrorView(view: UIView) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConstraint = NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: view.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true
        
        let trailingConstraint = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: view.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingConstraint.isActive = true
        
        let topConstraint = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: view.superview, attribute: .bottom, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        
        let bottomConstraint = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: view.superview, attribute: .top, multiplier: 1, constant: 0)
        bottomConstraint.isActive = true
    }
    
    func setShaddowOn(view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.layer.shadowOpacity = 0.5
    }
}
