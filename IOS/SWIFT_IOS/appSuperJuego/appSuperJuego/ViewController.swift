//
//  ViewController.swift
//  appSuperJuego
//
//  Created by Jorge Cisneros on 17/05/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numero: UITextField!
    @IBOutlet weak var vidas: UILabel!
    @IBOutlet weak var labelMensaje: UILabel!
    
    var numRandom = 0
    var vida = 0
    
    func inicializar() {
        numRandom = Int.random(in: 0..<10) //(in: 0...9)
        numero.text = ""
        vida = 3
        vidas.text = String(vida)
        
        labelMensaje.text = "Selecciona un número del 0 - 9"
        
        self.view.backgroundColor = #colorLiteral(red: 0.6896661647, green: 0.540871623, blue: 0.9686274529, alpha: 1)
        
    }
    
    func alerta() {
        
        let alerta = UIAlertController(title: "Super Game", message: "Intentalo otra vez", preferredStyle: .alert)
        
        let jugarOtravez = UIAlertAction(title: "Juega", style: .default)
        
        alerta.addAction(jugarOtravez)
        
        self.present(alerta, animated: true, completion: nil)
        
    }
    
    @IBAction func botonPlay(_ sender: UIButton) {
        
        if numero.text == String(numRandom) {
            
            labelMensaje.text = "GANASTE 🥳"
            self.view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            
        } else {
            
            if vida == 1{
                
                labelMensaje.text = "FALLASTE, VUELVE A INTENTARLO"
                self.view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
                alerta()
                
            } else {
                
                vida -= 1
                vidas.text = String(vida)
                labelMensaje.text = "Vuelve a Intentarlo"
                
                numero.text = ""
                
            }
            
        }
        
    }
    
    @IBAction func botonReiniciar(_ sender: UIButton) {
        
        self.viewDidLoad()
        
    }
    
    @IBAction func botonSalir(_ sender: UIButton) {
        
        UIControl().sendAction( #selector( NSXPCConnection .suspend ), to:UIApplication.shared, for:nil )
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inicializar()
    }


}

