//
//  MainScene.swift
//  Portfolio
//
//  Created by Andreas Lüdemann on 25/08/2019.
//  Copyright © 2019 Andreas Lüdemann. All rights reserved.
//

import UIKit
import SceneKit

class MainScene: SCNScene {
    
    var aboutMeNode: SCNNode = SCNNode()
    var projectsNode: SCNNode = SCNNode()
    
    override init() {
        super.init()

        let aboutMeCube = SCNBox(width: 4.0, height: 4.0, length: 4.0, chamferRadius: 1.0)
        let aboutMeMaterial = SCNMaterial()
        aboutMeMaterial.diffuse.contents = UIImage(named: "AboutMe")
        aboutMeCube.materials = [aboutMeMaterial]

        aboutMeNode = SCNNode(geometry: aboutMeCube)
        aboutMeNode.name = "AboutMe"
        aboutMeNode.rotation = SCNVector4(x: 0.0, y: 0.3, z: 0.0, w: 0.0)
        aboutMeNode.position = SCNVector3(x: 2.0, y: 0, z: 0.0)
        aboutMeNode.opacity = 0.0
        self.rootNode.addChildNode(aboutMeNode)

        let projectsCube = SCNBox(width: 4.0, height: 4.0, length: 4.0, chamferRadius: 1.0)
        let projectsMaterial = SCNMaterial()
        projectsMaterial.diffuse.contents = UIImage(named: "Projects")
        projectsCube.materials = [projectsMaterial]

        projectsNode = SCNNode(geometry: projectsCube)
        projectsNode.name = "Projects"
        projectsNode.rotation = SCNVector4(x: 0.0, y: 0.0, z: 0.0, w: -Float(.pi/5.0))
        projectsNode.position = SCNVector3(x: 8.0, y: 0, z: 0.0)
        projectsNode.opacity = 0.0
        self.rootNode.addChildNode(projectsNode)
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.rotation = SCNVector4(x: 0.3, y: 0.0, z: 0.0, w: -atan2(0.0, 0.5))
        cameraNode.position = SCNVector3(x: 5.0, y: 0.0, z: 30.0)
        self.rootNode.addChildNode(cameraNode)
        
        let light = SCNLight()
        light.type = SCNLight.LightType.ambient
        light.color = UIColor(white: 0.25, alpha: 0.5)
        
        let lightNode = SCNNode()
        lightNode.light = light
        self.rootNode.addChildNode(lightNode)
        
        self.background.contents =
            ["BackgroundPattern.png",
             "BackgroundPattern.png",
             "BackgroundPattern.png",
             "BackgroundPattern.png",
             "BackgroundPattern.png",
             "BackgroundPattern.png"]
    }
    
    func startAnimations() {
        
        let aboutMeYAnimation = CABasicAnimation(keyPath: "position.y")
        aboutMeYAnimation.fromValue = 20.0
        aboutMeYAnimation.toValue = 0.5
        aboutMeYAnimation.duration = 1.0
        aboutMeYAnimation.beginTime = CACurrentMediaTime() + 0.4
        aboutMeYAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 1.5, 1, 1)
        aboutMeNode.addAnimation(aboutMeYAnimation, forKey: "aboutMeYAnimation")
        
        let aboutMeOpacityAnimation = CABasicAnimation(keyPath: "opacity")
        aboutMeOpacityAnimation.fromValue = 0.0
        aboutMeOpacityAnimation.toValue = 1.0
        aboutMeOpacityAnimation.duration = 1.0
        aboutMeOpacityAnimation.beginTime = CACurrentMediaTime() + 0.4
        aboutMeOpacityAnimation.fillMode = CAMediaTimingFillMode.forwards
        aboutMeOpacityAnimation.isRemovedOnCompletion = false
        aboutMeNode.addAnimation(aboutMeOpacityAnimation, forKey: "aboutMeOpacityAnimation")
        
        let projectsYAnimation = CABasicAnimation(keyPath: "position.y")
        projectsYAnimation.fromValue = -30.0
        projectsYAnimation.toValue = -0.5
        projectsYAnimation.duration = 1.0
        projectsYAnimation.beginTime = CACurrentMediaTime() + 0.8
        projectsYAnimation.timingFunction = CAMediaTimingFunction(controlPoints: 0.5, 1.5, 1, 1)
        projectsNode.addAnimation(projectsYAnimation, forKey: "projectsYAnimation")
        
        let projectsOpacityAnimation = CABasicAnimation(keyPath: "opacity")
        projectsOpacityAnimation.fromValue = 0.0
        projectsOpacityAnimation.toValue = 1.0
        projectsOpacityAnimation.duration = 1.0
        projectsOpacityAnimation.beginTime = CACurrentMediaTime() + 0.8
        projectsOpacityAnimation.fillMode = CAMediaTimingFillMode.forwards
        projectsOpacityAnimation.isRemovedOnCompletion = false
        projectsNode.addAnimation(projectsOpacityAnimation, forKey: "alphaAnimationRight")
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
