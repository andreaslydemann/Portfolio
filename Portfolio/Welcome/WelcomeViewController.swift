//
//  WelcomeViewController.swift
//  Portfolio
//
//  Created by Andreas Lüdemann on 25/08/2019.
//  Copyright © 2019 Andreas Lüdemann. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }()
    
    private let welcomeLabel: UILabel = {
       let label = UILabel()
        label.text = """
        Hello.
        My name is Andreas Lüdemann and the app you're looking at is my portfolio.
        You can swipe, pinch and drag your finger around in the following view.
        Have fun 🎉
        """
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurEffectView.contentView.addSubview(welcomeLabel)
        welcomeLabel.anchor(top: blurEffectView.contentView.topAnchor, leading: blurEffectView.contentView.leadingAnchor, bottom: blurEffectView.contentView.bottomAnchor, trailing: blurEffectView.contentView.trailingAnchor)
        
        view.addSubview(blurEffectView)
        blurEffectView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismiss(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismiss(_ tapGesture: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
