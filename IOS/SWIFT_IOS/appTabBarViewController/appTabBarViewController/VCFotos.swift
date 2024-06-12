//
//  VCFotos.swift
//  appTabBarViewController
//
//  Created by Jorge Cisneros on 06/06/24.
//

import UIKit

class VCFotos: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
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
            
        }
        
        dismiss(animated: true, completion: nil)
        
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
