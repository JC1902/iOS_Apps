//
//  ViewController.swift
//  appConjuntos
//
//  Created by Jorge Cisneros on 21/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    var setA = Set<String>()
    var setB = Set<String>()
    
    @IBOutlet weak var textoConjuntoA: UITextField!
    @IBOutlet weak var textoConjuntoB: UITextField!
    
    @IBOutlet weak var labelResultado: UILabel!
    
    @IBOutlet weak var botonAsignarSetA: UIButton!
    @IBOutlet weak var botonAsignarSetB: UIButton!
    @IBOutlet weak var botonUnion: UIButton!
    
    @IBAction func textoSetAChanged(_ sender: UITextField) {
        
        // validar contenido y el estado de los botones
        if !textoConjuntoA.text!.isEmpty {
            
            botonAsignarSetA.isEnabled = true
            
        }
        
    }
    
    @IBAction func botonAsignarSetA(_ sender: UIButton) {
        
        if !textoConjuntoA.text!.isEmpty {
            
            let conjunto:[String] = textoConjuntoA.text!.components(separatedBy: ",")
            
            setA = Set<String>()
            
            for valor in conjunto {
                setA.insert(valor)
            }
            
        }
        
        textoConjuntoB.isEnabled = true
        
    }
    
    @IBAction func textoSetBChanged(_ sender: UITextField) {
        
        if !textoConjuntoB.text!.isEmpty {
            
            botonAsignarSetB.isEnabled = true
            
        }
        
    }
    
    @IBAction func botonAsignarSetB(_ sender: UIButton) {
        
        if !textoConjuntoB.text!.isEmpty {
            
            let conjunto : [String] = textoConjuntoB.text!.components(separatedBy: ",")
            
            setB = Set<String>()
            
            for valor in conjunto {
                
                setB.insert(valor)
                
            }
            
        }
        
        botonUnion.isEnabled = true
        
    }
    
    @IBAction func botonUnion(_ sender: UIButton) {
        
        let unionAB = setA.union(setB).sorted()
        
        labelResultado.text = unionAB.joined(separator: ",")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

