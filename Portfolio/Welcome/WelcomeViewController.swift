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
        let mutableAttributedString = NSMutableAttributedString()
        
        let boldAttribute: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 22)!,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        let regularAttribute: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Thin", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.gray
        ]
        
        let helloString = NSAttributedString(string: "Hello.\n", attributes: boldAttribute)
        let descriptionString = NSAttributedString(string: "My name is Andreas Lüdemann and the app you're looking at is my portfolio. You can swipe, pinch and drag your finger around in the following view.", attributes: regularAttribute)
        let haveFunString = NSAttributedString(string: "\nHave fun 🎉", attributes: boldAttribute)
        
        mutableAttributedString.append(helloString)
        mutableAttributedString.append(descriptionString)
        mutableAttributedString.append(haveFunString)

        label.attributedText = mutableAttributedString
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurEffectView.contentView.addSubview(welcomeLabel)
        welcomeLabel.anchor(top: blurEffectView.contentView.topAnchor, leading: blurEffectView.contentView.leadingAnchor, bottom: blurEffectView.contentView.bottomAnchor, trailing: blurEffectView.contentView.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
        view.addSubview(blurEffectView)
        blurEffectView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismiss(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismiss(_ tapGesture: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
