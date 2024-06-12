//
//  VCConjuntos.swift
//  appTabBarViewController
//
//  Created by Jorge Cisneros on 10/06/24.
//

import UIKit

class VCConjuntos: UIViewController {
    
    @IBOutlet weak var operacionConjunto: UISegmentedControl!
    @IBOutlet weak var tipoConjunto: UISegmentedControl!
    @IBOutlet weak var ponerEnConjunto: UISegmentedControl!
    
    @IBOutlet weak var txtEntrada: UITextField!
    @IBOutlet weak var lblConjuntos: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var animales : Set = ["🐻‍❄️","🐤","🙊","🦊","🐻","🐔","🐧"]
    var alimentos : Set = ["🥝","🍋","🍑","🥭","🍠","🍒","🍓"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtEntrada.delegate = self
    }
    
    @IBAction func operacionConjunto(_ sender: UISegmentedControl) {
        
        let indice = sender.selectedSegmentIndex
        
        switch indice {
        case 0:
            let unionAniAli = animales.union( alimentos )
            lblConjuntos.text = "Union: \(unionAniAli)"
            imageView.image = UIImage(named: "union")
        case 1:
            let interAniAli = animales.intersection( alimentos )
            lblConjuntos.text = "Intersección: \( interAniAli )"
            imageView.image = UIImage(named: "interseccion")
        case 2:
            let difAniAli = animales.subtracting( alimentos )
            lblConjuntos.text = "Diferencia: \( difAniAli )"
            imageView.image = UIImage(named: "diferencia")
        case 3:
            let difSimAniAli = animales.symmetricDifference( alimentos )
            lblConjuntos.text = "Diferencia simétrica: \( difSimAniAli )"
            imageView.image = UIImage(named: "dif_simetrica")
        default:
            break
        }
        
    }
    
    @IBAction func agregarEnConjunto(_ sender: UISegmentedControl) {
        
        let indice = sender.selectedSegmentIndex
        
        switch indice {
        case 0:
            if !txtEntrada.text!.isEmpty {
                let conjunto:[String] = txtEntrada.text!.components(separatedBy: "1")
                
                for emoji in conjunto {
                    animales.insert( emoji )
                }
            }
        case 1:
            if !txtEntrada.text!.isEmpty {
                let conjunto:[String] = txtEntrada.text!.components(separatedBy: "1")
                
                for emoji in conjunto {
                    alimentos.insert( emoji )
                }
            }
        default:
            break
        }
        
    }
    
    @IBAction func tipoConjunto(_ sender: UISegmentedControl) {
        
        let indice = sender.selectedSegmentIndex
        
        switch indice {
        case 0:
            let disjuntoAniAli = animales.isDisjoint(with: alimentos)
            
            if disjuntoAniAli {
                lblConjuntos.text = "Animales ES DISCONJUNTO de Alimentos"
            } else {
                lblConjuntos.text = "Animales NO ES DISCONJUNTO de Alimentos"
            }
            
            imageView.image = UIImage(named: "disconjunto")
        case 1:
            let subConAniAli = animales.isDisjoint(with: alimentos)
            
            if subConAniAli {
                lblConjuntos.text = "Animales ES SUBCONJUNTO de Alimentos"
            } else {
                lblConjuntos.text = "Animales NO ES SUBCONJUNTO de Alimentos"
            }
            
            imageView.image = UIImage(named: "subconjunto")
        case 2:
            let supConAniAli = animales.isDisjoint(with: alimentos)
            
            if supConAniAli {
                lblConjuntos.text = "Animales ES SUPERCONJUNTO de Alimentos"
            } else {
                lblConjuntos.text = "Animales NO ES SUPERCONJUNTO de Alimentos"
            }
            
            imageView.image = UIImage(named: "subconjunto")
        default:
            break
        }
        
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

extension VCConjuntos: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Validar si el string de reemplazo contiene solo emojis
        let isEmoji = string.unicodeScalars.allSatisfy { scalar in
            let isEmoji = scalar.properties.isEmoji
            return isEmoji
        }
        return isEmoji
    }
}

