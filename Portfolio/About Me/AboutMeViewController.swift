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
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.text = "Andreas Lüdemann"
        label.textAlignment = .center
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "me"))
        imageView.layer.borderWidth = 1.0
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.cornerRadius = 200 / 2
        imageView.clipsToBounds = true
        return imageView
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
        
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(myLabel)
        
        imageView.centerHorizontallyInSuperview(size: CGSize(width: 200, height: 200))
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        myLabel.anchor(top: imageView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 15, left: 0, bottom: 0, right: 0))
    }
    
    private func setupNavigationItems() {
        navigationItem.rightBarButtonItem = closeButton
        navigationItem.title = "About Me"
    }
    
    @objc func onClose() {
        self.dismiss(animated: true, completion: nil)
    }
}
