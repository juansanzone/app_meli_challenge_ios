//
//  Error.swift
//  
//
//  Created by Jose Luis Sagredo on 15/10/2019.
//

import Foundation

public extension Error {
    func isNetwork() -> Bool {
        switch self._code {
            case NSURLErrorTimedOut,
                 NSURLErrorCannotFindHost,
                 NSURLErrorCannotConnectToHost,
                 NSURLErrorDNSLookupFailed,
                 NSURLErrorNotConnectedToInternet:
                return true
            default: break
        }
        return false
    }
    
    var title:String {
        get {
            if self.isNetwork() {
                return NSLocalizedString("NetworkError_NotReached", comment: self.localizedDescription)
            }
            
            return NSLocalizedString("UnknownError", comment: self.localizedDescription)
        }
    }
    
    var description:String {
        get {
            if self.isNetwork() {
                return NSLocalizedString("NetworkError_NotReached_Description", comment: self.localizedDescription)
            }
            
            return NSLocalizedString("UnknownError_Description", comment: self.localizedDescription)
        }
    }

}
