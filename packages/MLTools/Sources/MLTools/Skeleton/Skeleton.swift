//
//  Skeleton.swift
//  
//
//  Created by Jose Luis Sagredo on 19/10/2019.
//

import Foundation
import UIKit

public class Skeleton {
    typealias SkeletonGradient = CAGradientLayer
    private init() {}
    
    private static func getFilterView(view:UIView) -> [UIView] {
        var subviewsList = [UIView]()
        for subviewLoading in view.subviews {
            if subviewLoading.subviews.count <= 0 {
                subviewsList.append(subviewLoading)
            } else {
                for subSubviewLoading in subviewLoading.subviews {
                    subviewsList.append(subSubviewLoading)
                }
            }
        }
        return subviewsList
    }
    
    
    static func animateSkeletonStar(view:UIView) {
        Skeleton.animateSkeletonStop(view: view)
        
        for item in Skeleton.getFilterView(view: view) {
            DispatchQueue.main.async {
                let gradient = SkeletonGradient()
                gradient.frame = CGRect(origin: .zero, size: item.bounds.size)
                item.layer.insertSublayer(gradient, at:0)
                Skeleton.configureGradient(gradient)
            }
        }
    }
    
    static func animateSkeletonStop(view:UIView) {
        for item in Skeleton.getFilterView(view: view) {
            for layer:CALayer in item.layer.sublayers ?? [] {
                if layer is SkeletonGradient {
                    (layer as! SkeletonGradient).removeAllAnimations()
                    (layer as! SkeletonGradient).removeFromSuperlayer()
                }
            }
        }
    }
    
    private static func configureGradient(_ gradient : SkeletonGradient) {
        let backgroundFadedColor:UIColor = UIColor(
            red: (246.0/255.0),
            green: (247.0/255.0),
            blue: (248.0/255.0),
            alpha: 1
        )
        
        let gradientFirstStopColor:UIColor = UIColor(
            red: (238.0/255.0),
            green: (238.0/255.0),
            blue: (238.0/255.0),
            alpha: 1
        )
        
        let gradientSecondStopColor:UIColor = UIColor(
            red: (221.0/255.0),
            green: (221.0/255.0),
            blue: (221.0/255.0) ,
            alpha: 1
        )
        
        let gradientFirstStop:Double = 0.1
        let gradientWidth:Double = 0.18
        let loaderDuration:Double = 0.85
        
        gradient.startPoint = CGPoint(x: -1.0 + CGFloat(gradientWidth), y: 0)
        gradient.endPoint = CGPoint(x: 1.0 + CGFloat(gradientWidth), y: 0)
        
        gradient.colors = [
            backgroundFadedColor.cgColor,
            gradientFirstStopColor.cgColor,
            gradientSecondStopColor.cgColor,
            gradientFirstStopColor.cgColor,
            backgroundFadedColor.cgColor
        ]
        
        let startLocations = [
            NSNumber(value: Double(gradient.startPoint.x)),
            NSNumber(value: Double(gradient.startPoint.x)),
            NSNumber(value: Double(0)),
            NSNumber(value: Double(gradientWidth)),
            NSNumber(value: Double(1 + gradientWidth))
        ]
        
        gradient.locations = startLocations
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = startLocations
        gradientAnimation.toValue = [
            NSNumber(value: Double(0)),
            NSNumber(value: Double(1)),
            NSNumber(value: Double(1)),
            NSNumber(value: Double(1 + (gradientWidth - gradientFirstStop))),
            NSNumber(value: Double(1 + gradientWidth))
        ]
        
        gradientAnimation.repeatCount = Float.infinity
        gradientAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientAnimation.isRemovedOnCompletion = false
        gradientAnimation.duration = loaderDuration
        gradient.add(gradientAnimation ,forKey:"locations")
        
    }
}

public extension UIView {
    func animateSkeletonStar() {
        Skeleton.animateSkeletonStar(view: self)
    }
    
    func animateSkeletonStop() {
        Skeleton.animateSkeletonStop(view: self)
    }
}
