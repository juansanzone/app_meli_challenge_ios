//
//  ViewModel.swift
//  
//
//  Created by Jose Luis Sagredo on 15/10/2019.
//

import Foundation

open class ViewModel<T>:StateViewModel  {
    
    ///Property that saves your information
    public var data:T
    
    ///Initialization
    /// - Parameters:
    ///     - default: the default data when the view model instance
    public init(_ _default:T) {
        //super.init()
        self.data = _default
    }
    
    ///Method that your custom view model must override to request new information
    open func requestData() {}
}
