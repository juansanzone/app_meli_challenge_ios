//
//  State.swift
//  
//
//  Created by Jose Luis Sagredo on 15/10/2019.
//

import Foundation

///Define the view model ui states
public enum State {
    ///Option says that the view model ui starts
    case start
    ///Option says that the view model ui is loading
    case loading
    ///Option says that the view model finish loading success
    case success
    ///Option says that the view model finish loading by error
    case error(Error)
}

extension State: Equatable {
    
    public static func ==(lhs: State, rhs:State) -> Bool {
        switch lhs {
            case .start:
                switch rhs {
                case .start:
                    return true
                case .loading, .success, .error:
                    return false
            }
            case .loading:
                switch rhs {
                case .loading:
                    return true
                case .start, .success, .error:
                    return false
            }
            case .success:
                switch rhs {
                case .success:
                    return true
                case .start, .loading, .error:
                    return false
            }
            case .error(let a):
                switch rhs {
                case .error(let b):
                    return a.localizedDescription == b.localizedDescription
                case .start, .loading, .success:
                    return false
                }
        }
    }
}
