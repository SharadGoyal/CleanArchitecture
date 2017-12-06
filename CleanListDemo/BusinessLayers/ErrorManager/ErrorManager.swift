//
//  ErrorManager.swift
//  IELTSNew
//
//  Created by Chanchal Chauhan on 29/11/16.
//

struct ErrorManager {
    
    /// This method is used to create custom error which contains error code, error message, and title
    ///
    ///     ErrorManager.processError(error: error)
    ///     or
    ///     ErrorManager.processError(errorCode: 10, errorMsg: "Msg String")
    ///
    /// - parameter error:    If we have error object then we can pass this in method. we need not to pass remaining parameters.
    /// - parameter errorCode: It accept custom error code.
	/// - parameter errorMsg: Indicates error message.
	/// - parameter responseStatus: Response status object for custom errors.
    /// - returns: Returns Custom error model object which contains error code, error message and alert title
    
    static func processError(error: Error? = nil, errorCode: Int? = nil, errorMsg: String? = nil) -> ErrorModel {
        
        var errorModel: ErrorModel!
		
		if error == nil {
            if let code = errorCode {
                errorModel = ErrorModel.error(errorCode: code, errorMessage: errorMsg, errorModel: error)
            } else {
                errorModel = ErrorModel.error(errorCode: 1001, errorMessage: AppStrings.AlertMessages.somthngWrong, errorModel: error)
            }
        } else {
            errorModel = ErrorModel.error(error: error!)
        }
        
        return errorModel
    }
    
}
