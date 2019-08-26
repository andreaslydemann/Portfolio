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
    
    let mainScene = MainScene()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sceneView = SCNView(frame: view.frame)
        sceneView.backgroundColor = UIColor.black
        sceneView.scene = mainScene as SCNScene
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTouch(_:)))
        sceneView.addGestureRecognizer(tapGestureRecognizer)
        
        view.addSubview(sceneView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        mainScene.startAnimations()
        
        Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(welcome), userInfo: nil, repeats: false)
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
        
        let sceneView = SCNView(frame: view.frame)
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
        
        view.addSubview(sceneView)
    }
    
    func presentViewController(_ identifier: String) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: identifier) {
            present(viewController, animated: true, completion: nil)
        }
    }
}
