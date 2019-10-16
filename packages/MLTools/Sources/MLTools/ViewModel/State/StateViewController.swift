//
//  StateViewController.swift
//  
//
//  Created by Jose Luis Sagredo on 15/10/2019.
//

import Foundation
import UIKit

///Custom UIViewController that you must to inherit
open class StateViewController: UIViewController {
    @IBOutlet public weak var errorView: UIView?
    @IBOutlet public weak var errorImageView: UIImageView?
    @IBOutlet public weak var errorTitleLabel: UILabel?
    @IBOutlet public weak var errorDesciptionLabel: UILabel?
    
    ///Property used to manage view model and ui relationship by state
    public var uiStateViewModel:StateViewModel = StateViewModel()
    
    /// View did load life cycle method
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.uiStateViewModel.observer = { [weak wSelf = self] in
            guard let sSelf = wSelf else {
                return
            }
            sSelf.onStateChange(state: sSelf.uiStateViewModel.state)
        }
        
        self.addSubview(self.errorView)
    }
    
    private func addSubview(_ _view:UIView?) {
        guard let newView = _view else {
            return
        }
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.isHidden = true
        let topConstraint = NSLayoutConstraint(
            item: newView,
            attribute:NSLayoutConstraint.Attribute.top,
            relatedBy:NSLayoutConstraint.Relation.equal,
            toItem:self.view,
            attribute:NSLayoutConstraint.Attribute.top,
            multiplier:1.0,
            constant:0.0
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: newView,
            attribute:NSLayoutConstraint.Attribute.bottom,
            relatedBy:NSLayoutConstraint.Relation.equal,
            toItem:self.view,
            attribute:NSLayoutConstraint.Attribute.bottom,
            multiplier:1.0,
            constant:0.0
        )
        
        let leftConstraint = NSLayoutConstraint(
            item: newView,
            attribute:NSLayoutConstraint.Attribute.left,
            relatedBy:NSLayoutConstraint.Relation.equal,
            toItem:self.view,
            attribute:NSLayoutConstraint.Attribute.left,
            multiplier:1.0,
            constant:0.0
        )
        
        let rightConstraint = NSLayoutConstraint(
            item: newView,
            attribute:NSLayoutConstraint.Attribute.right,
            relatedBy:NSLayoutConstraint.Relation.equal,
            toItem:self.view,
            attribute:NSLayoutConstraint.Attribute.right,
            multiplier:1.0,
            constant:0.0
        )
        
        self.view.addSubview(newView)
        self.view.addConstraints([topConstraint,bottomConstraint,leftConstraint,rightConstraint])
    }
    
    /// This calls ui methods when state change
    ///
    /// - Parameters:
    ///     - state: view model state
    ///
    public func onStateChange(state: State) {
        switch state {
        case .start: self.onStartUI(); break
        case .loading: self.onLoadingUI(); break
        case .error(let error): self.onErrorUI(error:error); break
        case .success: self.onSuccessUI(); break
        }
    }
    
    public func isLoading() -> Bool {
        return self.uiStateViewModel.state == State.loading
    }
    
    public func isError() -> Bool {
        switch self.uiStateViewModel.state {
            case .error(_): return true
            default: break
        }
        return false
    }
    
    /// This method is called by onStateChange when the new state value is "start", you must override this method to implement your own logic
    open func onStartUI() { }
    
    /// This method is called by onStateChange when the new state value is "loading", you must override this method to implement your own logic
    open func onLoadingUI() { }
    
    /// This method is called by onStateChange when the new state value is "success", you must override this method to implement your own logic
    open func onSuccessUI() { }
    
    /// This method is called by onStateChange when the new state value is "error", you must override this method to implement your own logic
    open func onErrorUI(error: Error) { }
    
    /// This method must be override to implement your own logic when you need to top some scroll view
    open func scrollToTop() { }
}
