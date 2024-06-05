//
//  ViewController.swift
//  appSceneKitMoverLuzCamara
//
//  Created by Jorge Cisneros on 03/06/24.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var segmentoLuces: UISegmentedControl!
    
    @IBOutlet weak var sliderLuzX: UISlider!
    @IBOutlet weak var sliderLuzY: UISlider!
    @IBOutlet weak var sliderLuzZ: UISlider!
    
    @IBOutlet weak var sliderCamaraX: UISlider!
    @IBOutlet weak var sliderCamaraY: UISlider!
    @IBOutlet weak var sliderCamaraZ: UISlider!
    
    var tipoLuz : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tipoLuz = "ambient"
        dibujaObjetos3D()
        
    }
    
    @IBAction func sliderLuzX(_ sender: UISlider) {
        sliderLuzX.value = sender.value
        dibujaObjetos3D()
    }
    
    @IBAction func slideCamaraX(_ sender: UISlider) {
        sliderCamaraX.value = sender.value
        dibujaObjetos3D()
    }
    
    @IBAction func sliderLuzY(_ sender: UISlider) {
        sliderLuzY.value = sender.value
        dibujaObjetos3D()
    }
    
    @IBAction func sliderCamaraY(_ sender: UISlider) {
        sliderCamaraY.value = sender.value
        dibujaObjetos3D()
    }
    
    @IBAction func sliderLuzZ(_ sender: UISlider) {
        sliderLuzZ.value = sender.value
        dibujaObjetos3D()
    }
    
    @IBAction func sliderCamaraZ(_ sender: UISlider) {
        sliderCamaraZ.value = sender.value
        dibujaObjetos3D()
    }
    
    @IBAction func segmentoTipoLuz(_ sender: UISegmentedControl) {
        
        let indice : Int = segmentoLuces.selectedSegmentIndex
        
        switch indice {
        case 0:
            tipoLuz = "ambient"
        case 1:
            tipoLuz = "directional"
        case 2:
            tipoLuz = "omni"
        case 3:
            tipoLuz = "spot"
        default:
            tipoLuz = "ambient"
        }
        
        dibujaObjetos3D()
        
    }
    
    
    func dibujaObjetos3D () {
        
        // Crear la vista de la escena
        let sceneView = SCNView( frame: self.imageView.frame )
        self.imageView.addSubview( sceneView )
        
        // Crear la escena
        let scene = SCNScene()
        sceneView.scene = scene
        
        // Crear la camara
        let camara = SCNCamera()
        let camaraNodo = SCNNode()
        camaraNodo.camera = camara
        
        camaraNodo.position = SCNVector3( sliderCamaraX.value, sliderCamaraY.value, sliderCamaraZ.value )
        
        // Crear la luz
        let luz = SCNLight()
        
        luz.type = SCNLight.LightType( rawValue: tipoLuz! )
        
        luz.spotInnerAngle = 30.0
        luz.spotOuterAngle = 70.0
        
        luz.castsShadow = true
        
        // Crear nodo para la luz
        let luzNodo = SCNNode()
        luzNodo.light = luz
        luzNodo.position = SCNVector3( sliderLuzX.value, sliderLuzY.value, sliderLuzZ.value )
        
        // Cubo
        let geometriaCubo = SCNBox( width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.1 )
        let cuboNodo = SCNNode( geometry: geometriaCubo )
        let constraint = SCNLookAtConstraint( target: cuboNodo )
        constraint.isGimbalLockEnabled = true
        camaraNodo.constraints = [ constraint ]
        luzNodo.constraints = [ constraint ]
        
        // Plano o piso
        let planoGeometria = SCNPlane( width: 100, height: 100 )
        let planoNodo = SCNNode( geometry: planoGeometria )
        
        planoNodo.eulerAngles = SCNVector3( GLKMathDegreesToRadians( -90 ), 0, 0 )
        planoNodo.position = SCNVector3( x: 0.0, y: -0.5, z: 0.0 )
        
        // Color del cubo
        let materialCubo = SCNMaterial()
        materialCubo.diffuse.contents = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        geometriaCubo.materials = [materialCubo]
        cuboNodo.position = SCNVector3( x: 0.5, y: 0, z: 0 )
        
        esfera( scene )
        
        // material para el plano
        let materialPlano = SCNMaterial()
        materialPlano.diffuse.contents = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        planoGeometria.materials = [ materialPlano ]
        
        // agregar nodos
        scene.rootNode.addChildNode( luzNodo )
        scene.rootNode.addChildNode( camaraNodo )
        //scene.rootNode.addChildNode( cuboNodo )
        scene.rootNode.addChildNode( planoNodo )
        
    }

    
    func esfera( _ scene: SCNScene ) {
        
        let sphereGeometry = SCNSphere( radius: 0.5 )
        let sphereNodo = SCNNode( geometry: sphereGeometry )
        sphereGeometry.firstMaterial?.diffuse.contents = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        sphereNodo.position = SCNVector3( x: 2.0, y: 0.0, z: 0.0 )
        
        scene.rootNode.addChildNode( sphereNodo )
    }
}

