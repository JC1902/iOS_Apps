//
//  VCFotos.swift
//  appTabBarViewController
//
//  Created by Jorge Cisneros on 06/06/24.
//

import UIKit

class VCFotos: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerColores: UIPickerView!
    @IBOutlet weak var auxImage: UIImageView!
    
    var colores: [ String ] = [ "🟪", "🟩", "🟦", "🟥", "🟧" ]
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
        // Agregar animacion
        self.imageView.alpha = 0.0
        UIImageView.animate(withDuration: 2) {
            self.imageView.frame =  CGRect(x: 0, y: 0, width: self.imageView.frame.width, height: self.imageView.frame.height)
            
            self.imageView.center = self.view.center
            
            self.imageView.alpha = 1.0
            
            self.imageView.layer.cornerRadius = 50
        }
        
        
        
        pickerColores.delegate = self
        pickerColores.dataSource = self
        
        
    }
    
    @IBAction func btnSeleccionarFoto(_ sender: UIButton) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickerImage = info[ UIImagePickerController.InfoKey.originalImage ] as? UIImage {
            
            imageView.contentMode = .scaleAspectFill
            imageView.image = pickerImage
            auxImage.image = pickerImage
            
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colores[ row ]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedColor = colores[row]
            
        // Cambia el color de la imagen en función del color seleccionado
        switch selectedColor {
        case "🟪":
            imageView.image = auxImage.image
            imageView.image = aplicarTinte(to: imageView.image!, with: .purple)
        case "🟩":
            imageView.image = auxImage.image
            imageView.image = aplicarTinte(to: imageView.image!, with: .green)
        case "🟦":
            imageView.image = auxImage.image
            imageView.image = aplicarTinte(to: imageView.image!, with: .blue)
        case "🟥":
            imageView.image = auxImage.image
            imageView.image = aplicarTinte(to: imageView.image!, with: .red)
        case "🟧":
            imageView.image = auxImage.image
            imageView.image = aplicarTinte(to: imageView.image!, with: .orange )
        default:
            break
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colores.count
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func aplicarTinte( to image: UIImage, with color: UIColor ) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions( image.size, false, image.scale )
        guard let context = UIGraphicsGetCurrentContext() , let cgImage = image.cgImage else { return nil }
        
        let rect = CGRect( origin: .zero, size: image.size )
        
        context.draw( cgImage, in: rect )
        context.setFillColor( color.withAlphaComponent( 0.3 ).cgColor )
        context.fill( rect )
        
        let tinteImagen = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return tinteImagen
        
    }

}
