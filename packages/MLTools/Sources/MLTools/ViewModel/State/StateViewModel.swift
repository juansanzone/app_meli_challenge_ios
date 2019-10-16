//
//  StateViewModel.swift
//  
//
//  Created by Jose Luis Sagredo on 15/10/2019.
//

import Foundation

///Define the view model state
open class StateViewModel {
    ///Property to save the view model state
    public var state:State = .start {
        didSet {
            self.observer()
        }
    }
    
    ///Change the state to loading
    public func loading() { self.state = .loading }
    
    ///Change the state to success
    public func success() { self.state = .success }
    
    ///Change the state to error
    public func error(error: Error) { self.state = .error(error) }
    
    ///Property to save observer block
    public var observer:() -> Void = { /* observer default */ }
}
