//
//  AboutMeViewController.swift
//  Portfolio
//
//  Created by Andreas Lüdemann on 26/08/2019.
//  Copyright © 2019 Andreas Lüdemann. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    private lazy var closeButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(onClose))
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "me"))
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.cornerRadius = 200 / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.attributedText = NSAttributedString(string: "Hi. I'm Andreas Lüdemann.", attributes: [
            NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 22)!,
            NSAttributedString.Key.foregroundColor: UIColor.black
            ])
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        let maxSize = CGSize(width: 150, height: 300)
        let size = label.sizeThatFits(maxSize)
        label.frame = CGRect(origin: CGPoint(x: 100, y: 100), size: size)
        
        let description = """
Hi! I am Andreas Lüdemann! I am a pragmatic software engineer with a few years of professional experience, specializing in mobile development. I mainly work with iOS and React Native development. My developer career started after getting a degree in Software Engineering. Since then, I’ve been passionate about building elegant apps with intuitive UI/UX. Currently, I’m working on an enterprise mobile banking app in Denmark with approximately 1 million active users.

Enjoy my app.
Thank you.
Andreas Lüdemann.
"""
        
        label.attributedText = NSAttributedString(string: description, attributes: [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Thin", size: 18)!,
            NSAttributedString.Key.foregroundColor: UIColor.black
            ])
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let roundButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        return button
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        scrollView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        scrollView.addSubview(imageView)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(descriptionLabel)
        
        imageView.centerHorizontallyInSuperview(size: CGSize(width: 200, height: 200))
        imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        nameLabel.anchor(top: imageView.bottomAnchor, leading: scrollView.leadingAnchor, bottom: nil, trailing: scrollView.trailingAnchor, padding: .init(top: 15, left: 0, bottom: 0, right: 0))
        descriptionLabel.anchor(top: nameLabel.bottomAnchor, leading: scrollView.leadingAnchor, bottom: scrollView.bottomAnchor, trailing: scrollView.trailingAnchor, padding: .init(top: 15, left: 15, bottom: 15, right: 15), size: .init(width: view.frame.size.width - 30, height: 0))
    }
    
    private func setupNavigationItems() {
        navigationController?.navigationBar.barTintColor = UIColor(red:0.2, green:0.381, blue:0.88, alpha:1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationItem.rightBarButtonItem = closeButton
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.title = "About Me"
    }
    
    @objc func onClose() {
        self.dismiss(animated: true, completion: nil)
    }
}
