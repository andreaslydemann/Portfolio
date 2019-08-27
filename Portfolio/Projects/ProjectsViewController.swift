//
//  ProjectsViewController.swift
//  Portfolio
//
//  Created by Andreas Lüdemann on 26/08/2019.
//  Copyright © 2019 Andreas Lüdemann. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {
    
    private lazy var closeButton = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(onClose))
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.text = "Check out these projects"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
        
        view.backgroundColor = .white
        view.addSubview(myLabel)
        
        myLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    private func setupNavigationItems() {
        navigationController?.navigationBar.barTintColor = UIColor(red:0.202, green:0.808, blue:0.459, alpha:1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 20)!,
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        navigationItem.rightBarButtonItem = closeButton
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.title = "Projects"
    }
    
    @objc func onClose() {
        self.dismiss(animated: true, completion: nil)
    }
}
