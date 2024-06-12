//
//  VCCalculadora.swift
//  appTabBarViewController
//
//  Created by Jorge Cisneros on 09/06/24.
//

import UIKit

class VCCalculadora: UIViewController {
    
    var entrada : String = ""
    var primerNumero: Int?
    var segundoNumero: Int?
    var operandoActual: String?
    
    @IBOutlet weak var lblPantalla: UILabel!
    @IBOutlet weak var tipoNumero: UISegmentedControl!
    @IBOutlet weak var txtConversion: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentoSeleccionado(_ sender: UISegmentedControl) {
        
        let indice : Int = sender.selectedSegmentIndex
        
        var numero : Int = Int(lblPantalla.text!)!
        
        if indice == 0 {
            
            // Verificar la conversion de numeros binarios negativos
            if numero < 0 {
            
                numero *= -1
                numero = 256 - numero
                
            }
            
            let n = String(numero, radix: 2)
            
            txtConversion.text = n
            
        } else if indice == 1 {
            
            let n = String(numero, radix: 8)
            
            txtConversion.text = n
            
        } else if indice == 2 {
            
            let n = String(numero, radix: 16)
            
            txtConversion.text = n
            
        }
        
    }
    
    
    @IBAction func botonesCalculadora(_ sender: UIButton) {
        
        guard let lblboton = sender.titleLabel?.text else { return }
        
        switch lblboton {
        case "0"..."9":
            entrada += lblboton
            lblPantalla.text = entrada
        case "+", "-", "x", "/":
            handleOperator(lblboton)
        case "=":
            calculateResult()
        case "C":
            entrada = "0"
            lblPantalla.text = entrada
            resetCalculator()
        default:
            break
        }
        
    }
    
    func handleOperator(_ operator: String) {
            if let input = Int(entrada) {
                if primerNumero == nil {
                    primerNumero = input
                } else if let _ = operandoActual {
                    segundoNumero = input
                    calculateResult()
                }
            }
            operandoActual = `operator`
            entrada = ""
        }
    
    func calculateResult() {
            guard let firstOperand = primerNumero, let currentOperator = operandoActual, let input = Int(entrada) else {
                return
            }
            
            segundoNumero = input
            
            var result: Int?
            
            switch currentOperator {
            case "+":
                result = firstOperand + segundoNumero!
            case "-":
                result = firstOperand - segundoNumero!
            case "x":
                result = firstOperand * segundoNumero!
            case "/":
                if segundoNumero != 0 {
                    result = firstOperand / segundoNumero!
                } else {
                    lblPantalla.text = "Error"
                    resetCalculator()
                    return
                }
            default:
                break
            }
            
            if let result = result {
                lblPantalla.text = String(result)
                self.primerNumero = result
                self.segundoNumero = nil
                self.entrada = ""
                self.operandoActual = nil
            }
        }
        
        func resetCalculator() {
            entrada = ""
            primerNumero = nil
            segundoNumero = nil
            operandoActual = nil
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
