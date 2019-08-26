//
//  ViewController.swift
//  Portfolio
//
//  Created by Andreas Lüdemann on 25/08/2019.
//  Copyright © 2019 Andreas Lüdemann. All rights reserved.
//

import UIKit
import SceneKit

class MainViewController: UIViewController {
    
    private let mainScene = MainScene()
    private lazy var sceneView: SCNView = {
        let sceneView = SCNView(frame: view.frame)
        return sceneView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupScene()
        mainScene.startAnimations()
        Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(welcome), userInfo: nil, repeats: false)
    }
    
    func setupScene() {
        sceneView.backgroundColor = UIColor.black
        sceneView.scene = mainScene as SCNScene
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTouch(_:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
        
        view.addSubview(sceneView)
    }
    
    @objc func welcome() {
        let vc = WelcomeViewController()
        
        let navController = UINavigationController(rootViewController: vc)
        navController.modalPresentationStyle = .overCurrentContext
        navController.modalTransitionStyle = .crossDissolve
        navController.isNavigationBarHidden = true
        
        self.present(navController, animated: true, completion: nil)
    }
    
    @objc func handleTouch(_ gestureRecognizer: UIGestureRecognizer) {
        let point = gestureRecognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(point, options: nil)
        
        if hitResults.count > 0 {
            let result: AnyObject! = hitResults[0]
            let material = result.node!.geometry!.firstMaterial!
            let name = result.node!.name!
            
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 0.5
            SCNTransaction.completionBlock = {() -> Void in
                SCNTransaction.begin()
                SCNTransaction.animationDuration = 0.5
                material.emission.contents = UIColor.black
                SCNTransaction.commit()
                
                self.presentViewController(name)
            }
            
            material.emission.contents = UIColor(white: 0.25, alpha: 0.25)
            SCNTransaction.commit()
        }
    }
    
    func presentViewController(_ name: String) {
        switch name {
        case "AboutMe":
            let navController = UINavigationController(rootViewController: AboutMeViewController())
            self.present(navController, animated: true, completion: nil)
        case "Projects":
            let navController = UINavigationController(rootViewController: ProjectsViewController())
            self.present(navController, animated: true, completion: nil)
        default: return
        }
    }
}
