//
//  ViewController.swift
//  appPickerViewProductos
//
//  Created by Jorge Cisneros on 27/05/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //--------------------------------------------------------
    
    func loadImage(named name: String) -> UIImage? {
        let filePath = Bundle.main.path(forResource: name, ofType: nil)
        if let path = filePath {
            let image = UIImage(contentsOfFile: path)
            return image
        }
        return nil
    }
    
    //--------------------------------------------------------
    
    let carro_color = [ [ "VW", "Toyota", "Ford", "Chrysler", "Honda", "Mazda" ], ["🚗", "🚌", "🚘"] ]
    
    let imagenes = ["bici1.jpg","camioneta1.jpg", "carro1.jpg", "BICI_1_copy.png","BICI_2.png", "carro11.png"]
    
    var images: [UIImage] = []
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var texto1: UITextField!
    @IBOutlet weak var pickerView1: UIPickerView!
    @IBOutlet weak var imageView1: UIImageView!
    
    //--------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pickerView1.delegate = self
        pickerView1.dataSource = self
        
        for imageName in imagenes {
            if let image = loadImage(named: imageName) {
                images.append(image)
            }
        }
        
    }
    
    //--------------------------------------------------------
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //--------------------------------------------------------
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return carro_color[component].count
    }
    
    //--------------------------------------------------------
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return carro_color[component][row]
    }
    
    //--------------------------------------------------------
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let carro = carro_color[0][pickerView.selectedRow(inComponent: 0)]
        
        let color = carro_color[1][pickerView.selectedRow(inComponent: 1)]
        
        let imagen = images[pickerView.selectedRow(inComponent: 0)]
        
        imageView1.image = imagen
        
        texto1.text = carro + " " + color
        
        label1.text = carro + " " + color
        
    }

    //--------------------------------------------------------

}

