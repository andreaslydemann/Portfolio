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
        label.text = "Projects"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItems()
        
        view.backgroundColor = .blue
        view.addSubview(myLabel)
        
        myLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    private func setupNavigationItems() {
        navigationItem.rightBarButtonItem = closeButton
        navigationItem.title = "Projects"
    }
    
    @objc func onClose() {
        self.dismiss(animated: true, completion: nil)
    }
}
