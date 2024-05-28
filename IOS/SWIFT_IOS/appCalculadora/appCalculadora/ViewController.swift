//
//  ViewController.swift
//  appCalculadora
//
//  Created by Jorge Cisneros on 20/05/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelNumero: UILabel!
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var stepper1: UIStepper!
    @IBOutlet weak var segmentoTipo: UISegmentedControl!
    @IBOutlet weak var textoSalida: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelNumero.text = String(Int(slider1.value))
        
    }

    @IBAction func segmentoSeleccionado(_ sender: UISegmentedControl) {
        
        let indice : Int = sender.selectedSegmentIndex
        
        var numero : Int = Int(labelNumero.text!)!
        
        if indice == 0 {
            
            // Verificar la conversion de numeros binarios negativos
            if numero < 0 {
            
                numero *= -1
                numero = 256 - numero
                
            }
            
            let n = String(numero, radix: 2)
            
            textoSalida.text = n
            
        } else if indice == 1 {
            
            let n = String(numero, radix: 8)
            
            textoSalida.text = n
            
        } else if indice == 2 {
            
            let n = String(numero, radix: 16)
            
            textoSalida.text = n
            
        }
        
    }
    
    @IBAction func valorCambiado(_ sender: UISlider) {
        
        labelNumero.text = "\( String( describing: lround( Double( sender.value ) ) ) )"
        
        stepper1.value = Double(sender.value)
        
        self.segmentoSeleccionado(segmentoTipo)
        
    }
    
    @IBAction func stepperCambio(_ sender: UIStepper) {
        
        labelNumero.text = "\( String( describing: lround( Double( sender.value ) ) ) )"
        
        slider1.value = Float( Double( stepper1.value ) )
        
        self.segmentoSeleccionado( segmentoTipo )
        
    }
    
}

