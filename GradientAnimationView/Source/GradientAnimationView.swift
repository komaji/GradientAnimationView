//
//  GradientAnimationView.swift
//  GradientAnimationView
//
//  Created by komaji on 2018/05/03.
//  Copyright © 2018年 komaji. All rights reserved.
//

import UIKit

public class GradientAnimationView: UIView {
    
    let fromGradientPoints = (start: CGPoint(x: -1.0, y: 0.5), end: CGPoint(x: 0.0, y: 0.5))
    let toGradientPoints = (start: CGPoint(x: 1.0, y: 0.5), end: CGPoint(x: 2.0, y: 0.5))
    
    lazy var gradientLayer: CAGradientLayer = {
        let gray = #colorLiteral(red: 0.9467939734, green: 0.9468161464, blue: 0.9468042254, alpha: 1).cgColor
        let white = #colorLiteral(red: 0.9633155465, green: 0.9633155465, blue: 0.9633155465, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.colors = [gray, white, gray]
        
        gradientLayer.startPoint = fromGradientPoints.start
        gradientLayer.endPoint = fromGradientPoints.end
        
        return gradientLayer
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.addSublayer(gradientLayer)
        startAnimating()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
    }
    
    func startAnimating() {
        let animationDuration: CFTimeInterval = 1.0
        let waitingDuration: CFTimeInterval = 0.5
        
        let startPointAnimation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.startPoint))
        startPointAnimation.fromValue = fromGradientPoints.start
        startPointAnimation.toValue = toGradientPoints.end
        startPointAnimation.duration = animationDuration
        
        let endPointAnimation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.endPoint))
        endPointAnimation.fromValue = fromGradientPoints.end
        endPointAnimation.toValue = toGradientPoints.end
        endPointAnimation.duration = animationDuration
        
        let group = CAAnimationGroup()
        group.animations = [startPointAnimation, endPointAnimation]
        group.duration = animationDuration + waitingDuration
        group.repeatCount = .infinity
        
        gradientLayer.add(group, forKey: nil)
    }
    
}

