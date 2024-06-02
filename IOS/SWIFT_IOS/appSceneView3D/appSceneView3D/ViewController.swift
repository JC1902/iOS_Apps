//
//  ViewController.swift
//  appSceneView3D
//
//  Created by Jorge Cisneros on 31/05/24.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let sceneView = SCNView( frame: self.view.frame )
        
        sceneView.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        self.view.addSubview( sceneView )
        
        let scene = SCNScene()
        sceneView.scene = scene
        let camara = SCNCamera()
        let camaraNodo = SCNNode()
        
        camaraNodo.camera = camara
        camaraNodo.position = SCNVector3(3.0, 3.0, 3.0)
        
        // DEFINIR LA LUZ
        let luz = SCNLight()
        luz.type = SCNLight.LightType.omni
        
        let luzNodo = SCNNode()
        luzNodo.light = luz
        luzNodo.position = SCNVector3(1.0, 1.0, 1.5)
        
        // DEFINIR EL CUBO
        let cubo = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        cubo.firstMaterial?.diffuse.contents = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
        let cuboNodo = SCNNode(geometry: cubo)
        
        let constraint = SCNLookAtConstraint(target: cuboNodo)
        constraint.isGimbalLockEnabled = true
        
        camaraNodo.constraints = [ constraint ]
        
        scene.rootNode.addChildNode( luzNodo )
        scene.rootNode.addChildNode( camaraNodo )
        scene.rootNode.addChildNode( cuboNodo )
        
    }


}

