//
//  GameViewController.swift
//  tvquiz
//
//  Created by Max Bilbow on 17/10/2015.
//  Copyright (c) 2015 Rattle Media Ltd. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // create and add a camera to the scene
        let cameraNode = scene.rootNode.childNodeWithName("mainCamera", recursively: false)!
       
        floor = scene.rootNode.childNodeWithName("floor", recursively: false)!
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        cameras.append(cameraNode)
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = SCNLightTypeOmni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = UIColor.darkGrayColor()
        scene.rootNode.addChildNode(ambientLightNode)
        
        
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
//        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = UIColor.blackColor()
        
        // add a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: "handleTap:")
        let panGesture = UIPanGestureRecognizer(target: self, action: "handlePan:")
        let longPressGesture = UIPanGestureRecognizer(target: self, action: "handleLongPress:")
        var gestureRecognizers = [UIGestureRecognizer]()
        gestureRecognizers.append(tapGesture)
        gestureRecognizers.append(panGesture)
        gestureRecognizers.append(longPressGesture)
        if let existingGestureRecognizers = scnView.gestureRecognizers {
            gestureRecognizers.appendContentsOf(existingGestureRecognizers)
            
        }
        for gr in gestureRecognizers {
            print(gr.description)
        }
        scnView.gestureRecognizers = gestureRecognizers
        
    }
    var floor: SCNNode!
    var cameras: [SCNNode] = []
    enum ControllMode {
        case Camera, Floor
    }
    var controllMode: ControllMode! = .Floor
    
    var lastPos: CGPoint?
    func handleLongPress(recogniser: UILongPressGestureRecognizer) {
//        let dx = recogniser.locationInView(<#T##view: UIView?##UIView?#>)
        if recogniser.state == .Began {
            lastPos = recogniser.locationInView(recogniser.view)
        } else if recogniser.state == .Ended {
            lastPos = nil
        } else if let lastPos = lastPos {
            let node = controllMode == .Floor ? floor : cameras.first!
            let newPos = recogniser.locationInView(recogniser.view)
            let dx = newPos.x - lastPos.x
            let dy = newPos.y - lastPos.y
            self.lastPos = newPos
            node.eulerAngles.x += Float(dy) * 0.0005
            node.eulerAngles.z += Float(dx) * -0.0005
            
        }
        
        
    }
    
//    override func pressesCancelled(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
//        controllMode = .Floor
//    }
//    override func pressesBegan(presses: Set<UIPress>, withEvent event: UIPressesEvent?) {
//        controllMode = .Camera
//    }
//    
    func handleTap(gestureRecognize: UIGestureRecognizer) {
        if (controllMode != nil) {
        return
        }
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // check what nodes are tapped
        let p = gestureRecognize.locationInView(scnView)
        let hitResults = scnView.hitTest(p, options: nil)
        // check that we clicked on at least one object
        if hitResults.count > 0 {
            // retrieved the first clicked object
            let result: AnyObject! = hitResults[0]
            
            // get its material
            let material = result.node!.geometry!.firstMaterial!
            
            // highlight it
            SCNTransaction.begin()
            SCNTransaction.setAnimationDuration(0.5)
            
            // on completion - unhighlight
            SCNTransaction.setCompletionBlock {
                SCNTransaction.begin()
                SCNTransaction.setAnimationDuration(0.5)
                
                material.emission.contents = UIColor.blackColor()
                
                SCNTransaction.commit()
            }
            
            material.emission.contents = UIColor.redColor()
            
            SCNTransaction.commit()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
