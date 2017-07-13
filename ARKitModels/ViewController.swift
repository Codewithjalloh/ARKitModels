//
//  ViewController.swift
//  ARKitModels
//
//  Created by wealthyjalloh on 13/07/2017.
//  Copyright © 2017 CWJ. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration = ARWorldTrackingSessionConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
        
        
    }
    
    
    
    // get cam coordinates
    func getYourCameraCoordinate(sceneView: ARSCNView) -> CameraCoordinate {
        
        let currentCameraTransform = sceneView.session.currentFrame?.camera.transform
        
        let cameraCoordinates = MDLTransform(matrix: currentCameraTransform!)
        
        var camCoord = CameraCoordinate()
        
        camCoord.x = cameraCoordinates.translation.x
        camCoord.y = cameraCoordinates.translation.y
        camCoord.z = cameraCoordinates.translation.z
        
        
        return camCoord
        
        
    }
    
    // lamp
    @IBAction func lampButtonPressed(_ sender: Any) {
        let lampNode = SCNNode()
        let camCoord = getYourCameraCoordinate(sceneView: sceneView)
        lampNode.position = SCNVector3(camCoord.x, camCoord.y, camCoord.z)
        
        guard let modelObjScene = SCNScene(named:"lamp.scn", inDirectory: "Models.scnassets/lamp" ) else {
            return
        }
        
        let coverNode = SCNNode()
        for child in modelObjScene.rootNode.childNodes {
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            coverNode.addChildNode(child)
        }
        
        lampNode.addChildNode(coverNode)
        sceneView.scene.rootNode.addChildNode(lampNode)
        
        
    }
    
    // chair
    @IBAction func chairButtonPressed(_ sender: Any) {
        
        
        let chairNode = SCNNode()
        let camCoord = getYourCameraCoordinate(sceneView: sceneView)
        chairNode.position = SCNVector3(camCoord.x, camCoord.y, camCoord.z)
        
        guard let modelObjScene = SCNScene(named:"chair.scn", inDirectory: "Models.scnassets/chair" ) else {
            return
        }
        
        let coverNode = SCNNode()
        for child in modelObjScene.rootNode.childNodes {
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            coverNode.addChildNode(child)
        }
        
        chairNode.addChildNode(coverNode)
        sceneView.scene.rootNode.addChildNode(chairNode)
    }
    
    // cup
    @IBAction func cupButtonPressed(_ sender: Any) {
        
        let cupNode = SCNNode()
        let camCoord = getYourCameraCoordinate(sceneView: sceneView)
        cupNode.position = SCNVector3(camCoord.x, camCoord.y, camCoord.z)
        
        guard let modelObjScene = SCNScene(named:"cup.scn", inDirectory: "Models.scnassets/cup" ) else {
            return
        }
        
        let coverNode = SCNNode()
        for child in modelObjScene.rootNode.childNodes {
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            coverNode.addChildNode(child)
        }
        
        cupNode.addChildNode(coverNode)
        sceneView.scene.rootNode.addChildNode(cupNode)
    }
    
    // candle
    @IBAction func candleButtonPressed(_ sender: Any) {
        
        let candleNode = SCNNode()
        let camCoord = getYourCameraCoordinate(sceneView: sceneView)
        candleNode.position = SCNVector3(camCoord.x, camCoord.y, camCoord.z)
        
        guard let modelObjScene = SCNScene(named:"candle.scn", inDirectory: "Models.scnassets/candle" ) else {
            return
        }
        
        let coverNode = SCNNode()
        for child in modelObjScene.rootNode.childNodes {
            child.geometry?.firstMaterial?.lightingModel = .physicallyBased
            coverNode.addChildNode(child)
        }
        
        candleNode.addChildNode(coverNode)
        sceneView.scene.rootNode.addChildNode(candleNode)
    }
    
    

}

