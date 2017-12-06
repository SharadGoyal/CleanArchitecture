//
//  ErrorModel.swift
//  IELTSNew
//
//  Created by Chanchal Chauhan on 24/11/16.
//

import Foundation

private let requestTimeoutError = "Something went wrong. Please try again later."
private let noInternet = "You are not connected to internet."
private let requestTimeoutTitle = "Connection Fail"
private let noInternetTitle = "No Internet Connection"

struct ErrorModel {
    var errorTitle: String?
    var errorCode: Int!
    var errorMessage: String?
	var errorModel: Error?
	
	/// This method take error code and error message as argument and return object of error model class which contains error code, error message and error title
	///
	/// - Parameters:
	///   - errorCode: custom error code
	///   - errorMessage: custom error message
	///   - responseErrorModel: an error model object which is subclass of `ResponseStatus` class.
	/// - Returns: ErrorModel object
    static func error(errorCode: Int, errorMessage: String?, errorModel: Error? = nil) -> ErrorModel {
        // For all errors from server
		return ErrorModel(errorTitle: nil, errorCode: errorCode, errorMessage: errorMessage, errorModel: errorModel)
    }
    
    
    /// This method takes Error type as argument and convert it into ErrorModel object
    ///
    /// - parameter error: Error type variable
    ///
    /// - returns: ErrorModel object
    static func error(error: Error) -> ErrorModel {
        
        let code = error._code
        let message = getErrorMessage(error: error)
        let title = getErrorTitle(error: error)
        
		return ErrorModel(errorTitle: title, errorCode: code, errorMessage: message, errorModel: nil)
    }
	
	/// Create an error model object from response status object
	///
	/// - Parameter responseStatus: response error model.
	/// - Returns: Error Model object
	static func error(errorModel: Error) -> ErrorModel {
		return ErrorModel(errorTitle: nil, errorCode: nil, errorMessage: nil, errorModel: errorModel)
	}
    
    
    /// This method returns error message based on error code
    ///
    /// - parameter error: Error type variable
    ///
    /// - returns: error message as String type
    private static func getErrorMessage(error: Error) -> String {
        var message = ""
        switch error._code {
            
        // For Request Timed Out, Network Connection lost and cannot connect to host
        case NSURLErrorTimedOut, NSURLErrorNetworkConnectionLost, NSURLErrorCannotConnectToHost, NSURLErrorCannotFindHost:
            message = requestTimeoutError + " (Code: \(error._code))"
            
        // For No Internet connection
        case NSURLErrorNotConnectedToInternet:
            message = noInternet
        default:
            //message = Constants.ApiErrorMessage.unknownError
            message = error.localizedDescription + "(Code: \(error._code))"
        }
        return message
    }
    
    
    /// This method returns alert title based on error type
    ///
    /// - parameter error: Error type variable
    ///
    /// - returns: Alert Title as String type
    private static func getErrorTitle(error: Error) -> String? {
        
        var title: String? = nil
        
        switch error._code {
            
        // For Request Timed Out, Network Connection lost and cannot connect to host
        case NSURLErrorTimedOut, NSURLErrorNetworkConnectionLost, NSURLErrorCannotConnectToHost:
            title = requestTimeoutTitle
            
        // For no internet Connection
        case NSURLErrorNotConnectedToInternet:
            title = noInternetTitle
            
        default:
            title = nil
        }
        
        return title
    }
    
}
