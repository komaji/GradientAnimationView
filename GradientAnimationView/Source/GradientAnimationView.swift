//
//  GradientAnimationView.swift
//  GradientAnimationView
//
//  Created by komaji on 2018/05/03.
//  Copyright © 2018年 komaji. All rights reserved.
//

import UIKit

public class GradientAnimationView: UIView {
    
    public var centerColor = #colorLiteral(red: 0.934212029, green: 0.934212029, blue: 0.934212029, alpha: 1) {
        didSet {
            gradientLayer.colors = [sideCGColor, centerCGColor, sideCGColor]
        }
    }
    public var sideColor = #colorLiteral(red: 0.8774915338, green: 0.8774915338, blue: 0.8774915338, alpha: 1) {
        didSet {
            gradientLayer.colors = [sideCGColor, centerCGColor, sideCGColor]
        }
    }
    public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            gradientLayer.cornerRadius = cornerRadius
            
            if cornerRadius > 0.0 {
                clipsToBounds = true
            }
        }
    }
    public var animationDuration: CFTimeInterval = 1.0 {
        didSet {
            startPointAnimation.duration = animationDuration
            endPointAnimation.duration = animationDuration
            animationGroup.duration = animationDuration + waitingDuration
            restartAnimation()
        }
    }
    public var waitingDuration: CFTimeInterval = 0.5 {
        didSet {
            animationGroup.duration = animationDuration + waitingDuration
            restartAnimation()
        }
    }
    
    let animationKey = "GradientAnimation"
    let fromGradientPoints = (start: CGPoint(x: -1.0, y: 0.5), end: CGPoint(x: 0.0, y: 0.5))
    let toGradientPoints = (start: CGPoint(x: 1.0, y: 0.5), end: CGPoint(x: 2.0, y: 0.5))
    
    var centerCGColor: CGColor {
        return centerColor.cgColor
    }
    var sideCGColor: CGColor {
        return sideColor.cgColor
    }
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [sideCGColor, centerCGColor, sideCGColor]
        
        gradientLayer.startPoint = fromGradientPoints.start
        gradientLayer.endPoint = fromGradientPoints.end
        
        return gradientLayer
    }()
    lazy var startPointAnimation: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.startPoint))
        animation.fromValue = fromGradientPoints.start
        animation.toValue = toGradientPoints.end
        animation.duration = animationDuration
        
        return animation
    }()
    lazy var endPointAnimation: CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.endPoint))
        animation.fromValue = fromGradientPoints.end
        animation.toValue = toGradientPoints.end
        animation.duration = animationDuration
        
        return animation
    }()
    lazy var animationGroup: CAAnimationGroup = {
        let group = CAAnimationGroup()
        group.animations = [startPointAnimation, endPointAnimation]
        group.duration = animationDuration + waitingDuration
        group.repeatCount = .infinity
        
        return group
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
    }
    
    func setUp() {
        layer.addSublayer(gradientLayer)
        startAnimation()
    }
    
    func startAnimation() {
        gradientLayer.add(animationGroup, forKey: animationKey)
    }
    
    func restartAnimation() {
        gradientLayer.removeAnimation(forKey: animationKey)
        startAnimation()
    }
    
}

