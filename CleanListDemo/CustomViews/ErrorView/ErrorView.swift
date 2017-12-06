//
//  ErrorView.swift
//  CleanListDemo
//
//  Created by Sharad Goyal on 07/11/17.
//  Copyright © 2017 Sharad Goyal. All rights reserved.
//

import Foundation
import UIKit

@objc protocol ErrorViewDelegate {
    @objc optional func retryBtnClickedOnErrorView()
}

enum ErrorType {
    case noInternet
    case noData
    case serverFailure
}

class ErrorView: UIView {
    
    // MARK: - Private constants
    private let errorViewIdentifier = "ErrorView"
    private let noInternetMessage = "Please check your Internet connection."
    private let noDataMessage = "No data found"
    private let serverErrorMessage = "Server Connection failed"
    
    // MARK: - delegate property declaration
    var errorViewDelegate: ErrorViewDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet weak var buttonRetry: UIButton!
    @IBOutlet weak var imageViewError: UIImageView!
    @IBOutlet weak var labelError: UILabel!
    
    // MARK: IBAction methods
    @IBAction func clickedBtnRetry(_ sender: UIButton) {
        if !Utile.isInternetAvailable() {
            
            return
        }
        self.errorViewDelegate?.retryBtnClickedOnErrorView?()
    }
    
    // MARK: - Initializer method
    func getErrorView(_ errorType:ErrorType, errorImage:UIImage? = nil, errorMessage:String? = nil) -> ErrorView {
        
        let errorView = Bundle.main.loadNibNamed(errorViewIdentifier, owner: self, options: nil)?.last as! ErrorView
        errorView.buttonRetry.setTitle(AppStrings.ButtonTitle.retry, for: .normal)
        switch errorType {
            
        case .noInternet:
            errorView.imageViewError.image = #imageLiteral(resourceName: "no_internet")
            errorView.labelError.text = AppStrings.AlertMessages.textNoInternet
            
        case .noData:
            errorView.imageViewError.image = errorImage ?? #imageLiteral(resourceName: "img_no_card")
            errorView.labelError.text = errorMessage ?? AppStrings.AlertMessages.noDataMessage
            errorView.buttonRetry.isHidden = true
            
        case .serverFailure:
            errorView.imageViewError.image = #imageLiteral(resourceName: "server_conn_failed")
            errorView.labelError.text = String.init(format: AppStrings.AlertMessages.somthngWrong, "-1001")
            
        }
        
        return errorView
    }
    
}

