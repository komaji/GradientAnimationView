//
//  ViewController.swift
//  Demo
//
//  Created by komaji on 2018/05/03.
//  Copyright © 2018年 komaji. All rights reserved.
//

import UIKit
import GradientAnimationView

class ViewController: UIViewController {

    @IBOutlet weak var gradientAnimationBackgroundView: UIView! {
        didSet {
            let view = GradientAnimationView()
            view.cornerRadius = 5.0
            view.sideColor = .gray
            view.centerColor = .lightGray
            view.animationDuration = 1.2
            view.waitingDuration = 0.6
            gradientAnimationBackgroundView.addSubview(view)
            
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: gradientAnimationBackgroundView.topAnchor),
                view.rightAnchor.constraint(equalTo: gradientAnimationBackgroundView.rightAnchor),
                view.leftAnchor.constraint(equalTo: gradientAnimationBackgroundView.leftAnchor),
                view.bottomAnchor.constraint(equalTo: gradientAnimationBackgroundView.bottomAnchor)
            ])
        }
    }
    
}

