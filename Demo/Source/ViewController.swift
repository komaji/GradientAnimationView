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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

