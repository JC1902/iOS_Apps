//
//  ViewController.swift
//  appBotaPelota
//
//  Created by Ivanovicx Nuñez on 11/06/24.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sliderColorMalla: UISlider!
    @IBOutlet weak var sliderColorEsfera: UISlider!
    @IBOutlet weak var segmentedOnda: UISegmentedControl!
    
    var capsuleNodes: [[SCNNode]] = []
    var esferaNode: SCNNode?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        planito()
    }

    @IBAction func sliderColorMalla(_ sender: UISlider) {
        
        sliderColorMalla.value = sender.value
        updateCapsuleColors()
        
    }
    
    @IBAction func sliderColorEsfera(_ sender: UISlider) {
        updateEsferaColor()
    }
    
    @IBAction func segmentoTipoCurva(_ sender: UISegmentedControl) {
        updateCapsuleHeights()
    }
    
    let gridSize = 25
    
    func sinFunction(x: Float,z: Float) -> Float {
       return 0.2 * sin(x * 5 + z * 3) + 0.1 * cos(x * 5 + z * 10 + 0.6) + 0.05 * cos(x * x * z)
    }

    func squareFunction(x: Float,z: Float) -> Float {
       return x * x + z * z
    }

    func planito() {
            let sceneView = SCNView(frame: self.imageView.frame)
            sceneView.backgroundColor = .black
            self.view.addSubview(sceneView)
            
            let scene = SCNScene()
            sceneView.scene = scene
            
            sceneView.autoenablesDefaultLighting = true
            sceneView.allowsCameraControl = true
            
            let capsuleRadius: CGFloat = 1.0 / CGFloat(gridSize - 1)
            let capsuleHeight: CGFloat = capsuleRadius * 4.0
            
            capsuleNodes = Array(repeating: Array(repeating: SCNNode(), count: gridSize), count: gridSize)

            var z: Float = Float(-gridSize + 1) * Float(capsuleRadius)

            for row in 0..<gridSize {
                var x: Float = Float(-gridSize + 1) * Float(capsuleRadius)
                for column in 0..<gridSize {
                    let capsule = SCNCapsule(capRadius: capsuleRadius, height: capsuleHeight)
                    let hue = CGFloat(sliderColorMalla.value + abs(x * z))
                    let color = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
                    capsule.firstMaterial?.diffuse.contents = color

                    let capsuleNode = SCNNode(geometry: capsule)
                    scene.rootNode.addChildNode(capsuleNode)

                    capsuleNode.position = SCNVector3Make(x, 0.0, z)

                    let y = CGFloat(squareFunction(x: x, z: z))
                    
                    switch segmentedOnda.selectedSegmentIndex {
                    case 0:
                        let y = CGFloat(squareFunction(x: x, z: z))
                    case 1:
                        let y = CGFloat(sinFunction(x: x, z: z))
                    default:
                        break
                    }

                    let moveUp = SCNAction.moveBy(x: 0, y: y, z: 0, duration: 1.0)
                    let moveDown = SCNAction.moveBy(x: 0, y: -y, z: 0, duration: 1.0)

                    let sequence = SCNAction.sequence([moveUp, moveDown])
                    let repeatedSequence = SCNAction.repeatForever(sequence)
                    capsuleNode.runAction(repeatedSequence)

                    capsuleNodes[row][column] = capsuleNode

                    x += 2.0 * Float(capsuleRadius)
                }
                z += 2.0 * Float(capsuleRadius)
            }
        
            esfera(scene: scene)
        }

        func updateCapsuleColors() {
            let capsuleRadius: CGFloat = 1.0 / CGFloat(gridSize - 1)
            var z: Float = Float(-gridSize + 1) * Float(capsuleRadius)

            for row in 0..<gridSize {
                var x: Float = Float(-gridSize + 1) * Float(capsuleRadius)
                for column in 0..<gridSize {
                    let hue = CGFloat(sliderColorMalla.value + abs(x * z))
                    let color = UIColor(hue: hue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
                    capsuleNodes[row][column].geometry?.firstMaterial?.diffuse.contents = color
                    x += 2.0 * Float(capsuleRadius)
                }
                z += 2.0 * Float(capsuleRadius)
            }
        }
    
    
    func updateCapsuleHeights() {
        let capsuleRadius: CGFloat = 1.0 / CGFloat(gridSize - 1)
            var z: Float = Float(-gridSize + 1) * Float(capsuleRadius)

            for row in 0..<gridSize {
                var x: Float = Float(-gridSize + 1) * Float(capsuleRadius)
                for column in 0..<gridSize {
                    let y: CGFloat
                    switch segmentedOnda.selectedSegmentIndex {
                    case 0:
                        y = CGFloat(squareFunction(x: x, z: z))
                    case 1:
                        y = CGFloat(sinFunction(x: x, z: z))
                    default:
                        y = 0.0
                    }

                    let moveUp = SCNAction.moveBy(x: 0, y: y, z: 0, duration: 1.0)
                    let moveDown = SCNAction.moveBy(x: 0, y: -y, z: 0, duration: 1.0)
                    let sequence = SCNAction.sequence([moveUp, moveDown])
                    let repeatedSequence = SCNAction.repeatForever(sequence)

                    // Eliminar las acciones de animación existentes
                    capsuleNodes[row][column].removeAllActions()

                    // Aplicar las nuevas acciones de animación con la nueva altura
                    capsuleNodes[row][column].position = SCNVector3(x, 0.0, z)
                    capsuleNodes[row][column].runAction(repeatedSequence)

                    x += 2.0 * Float(capsuleRadius)
                }
                z += 2.0 * Float(capsuleRadius)
            }
    }
    
    func esfera( scene: SCNScene ) {
        
        let esfera = SCNSphere( radius: 0.2 )
        let esferaNodo = SCNNode( geometry: esfera )
        
        esfera.firstMaterial?.diffuse.contents = UIColor( hue: CGFloat( sliderColorEsfera.value ), saturation: 1.0, brightness: 1.0, alpha: 1.0 )
        
        let moveUp = SCNAction.moveBy(x: 0.0, y: 1.0, z: 0.0, duration: 1.0)
        let moveDown = SCNAction.moveBy(x: 0.0, y: -1.0, z: 0.0, duration: 1.0)
        let sequence = SCNAction.sequence([moveUp,moveDown])
        
        let repetir = SCNAction.repeatForever( sequence )
        
        esferaNodo.runAction( repetir )
        
        scene.rootNode.addChildNode( esferaNodo )
        
        self.esferaNode = esferaNodo
    }
    
    func updateEsferaColor() {
        let color = UIColor(hue: CGFloat(sliderColorEsfera.value), saturation: 1.0, brightness: 1.0, alpha: 1.0)
        esferaNode?.geometry?.firstMaterial?.diffuse.contents = color
    }
}

