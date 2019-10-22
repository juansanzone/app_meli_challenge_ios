//
//  UISearchBar.swift
//  
//
//  Created by Jose Luis Sagredo on 22/10/2019.
//

import Foundation
import UIKit

public extension UISearchController {
    func fixOrigin() {
        self.searchBar.fixOrigin()
    }
}

public extension UISearchBar {
    // At the moment of animating the transition of sight, it modifies its origin
    func fixOrigin() {
        if let containerView = self.subviews.first?.subviews.filter({ (view) -> Bool in
            return String(describing: type(of: view)) == "_UISearchBarSearchContainerView"
        }).first {
            self.alpha = 0
            UIView.animate(withDuration: 0.1, delay: 0, options: UIView.AnimationOptions.layoutSubviews,
                           animations: {
                    containerView.frame = CGRect(origin: .zero, size: containerView.frame.size)
                    containerView.superview?.frame = CGRect(origin: .zero, size: containerView.frame.size)
            }) { (end) in
                self.alpha = 1
            }
        }
    }
}
