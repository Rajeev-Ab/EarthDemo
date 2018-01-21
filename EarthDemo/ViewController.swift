//
//  ViewController.swift
//  EarthDemo
//
//  Created by Rajeev on 26/12/17.
//  Copyright © 2017 MA. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        
        let sphere = SCNSphere(radius: 0.2)
        
        let metarial = SCNMaterial()
        
        metarial.diffuse.contents = UIImage(named: "art.scnassets/earth.jpg")
        sphere.materials = [metarial]
        
        // Show statistics such as fps and timing information
       let node = SCNNode()
        node.position = SCNVector3(0.0, 0.1, -0.7)
        
        node.geometry = sphere
        
        
        // adding moon
        let moon = SCNSphere(radius: 0.2)
        
        let moonMetarial = SCNMaterial()
        
        moonMetarial.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
        moon.materials = [moonMetarial]
        
        // Show statistics such as fps and timing information
        let moonNode = SCNNode()
        moonNode.position = SCNVector3(0.8, 0.1, -0.8)
        
        moonNode.geometry = moon
        
        // adding mars
        
        
        let marse = SCNSphere(radius: 0.2)
        
        let marseMetarial = SCNMaterial()
        
         marseMetarial.diffuse.contents = UIImage(named: "art.scnassets/mars.jpg")
        marse.materials = [marseMetarial]
        
        // Show statistics such as fps and timing information
        let marseNode = SCNNode()
        marseNode.position = SCNVector3(-0.9, 0.1, -0.8)
        
        marseNode.geometry = marse
        
        
        // Set the scene to the view
       sceneView.scene.rootNode.addChildNode(node)
        sceneView.scene.rootNode.addChildNode(moonNode)
        sceneView.scene.rootNode.addChildNode(marseNode)
        sceneView.automaticallyUpdatesLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
