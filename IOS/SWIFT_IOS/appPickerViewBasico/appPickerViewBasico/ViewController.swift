//
//  ViewController.swift
//  appPickerViewBasico
//
//  Created by Jorge Cisneros on 22/05/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var texto1: UITextField!
    
    var carro : [String] = ["VW", "Mazda", "Toyota", "Kia", "Tesla", "Ford", "Chryslar", "Honda"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pickerView1 = UIPickerView()
        pickerView1.delegate = self
        texto1.inputView = pickerView1
        texto1.text = "CLICK Y SELECCIONA TU 🚘"
        texto1.textAlignment = .center
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return carro[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        texto1.text = carro[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return carro.count
    }

}

