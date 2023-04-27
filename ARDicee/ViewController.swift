//
//  ViewController.swift
//  ARDicee
//
//  Created by Shaurya on 2023-04-24.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
        let scene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        
        let diceNode = scene.rootNode.childNode(withName: "Dice", recursively: true)
        
        //        sceneView.scene = scene
        
        //        let sphere = SCNSphere(radius: 0.2)
        //        let material = SCNMaterial()
        //
        //        material.diffuse.contents = UIImage(named: "art.scnassets/earth.jpeg")
        //
        //        sphere.materials = [material]
        //
        //        let node = SCNNode()
        //
        //        node.position = SCNVector3(x: 0, y: -0.1, z: -0.5)
        //
        //        node.geometry = sphere
        //        sceneView.scene.rootNode.addChildNode(node)
        //
        
        sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if ARWorldTrackingConfiguration.isSupported {
            // Create a session configuration
            let configuration = ARWorldTrackingConfiguration()
            
            
            // Run the view's session
            sceneView.session.run(configuration)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
}
