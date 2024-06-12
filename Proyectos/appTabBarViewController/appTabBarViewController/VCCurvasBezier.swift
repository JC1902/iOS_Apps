//
//  VCCurvasBezier.swift
//  appTabBarViewController
//
//  Created by Jorge Cisneros on 06/06/24.
//

import UIKit

class VCCurvasBezier: UIViewController {

    @IBOutlet weak var canvas: CurvasBezier!
    
    @IBOutlet weak var x1: UIStepper!
    @IBOutlet weak var y1: UIStepper!
    @IBOutlet weak var x2: UIStepper!
    @IBOutlet weak var y2: UIStepper!
    
    @IBOutlet weak var puntoCx1: UIStepper!
    @IBOutlet weak var puntoCy1: UIStepper!
    @IBOutlet weak var puntoCx2: UIStepper!
    @IBOutlet weak var puntoCy2: UIStepper!
    
    @IBOutlet weak var lblAncho: UILabel!
    @IBOutlet weak var lblAlto: UILabel!
    
    @IBOutlet weak var btnAnchoAlto: UIButton!
    
    @IBOutlet weak var tipoCurva: UISegmentedControl!
    
    // Método para actualizar la curva de Bezier
    func actualizarCurvaBezier() {
        self.canvas.x1 = Int(x1.value)
        self.canvas.y1 = Int(y1.value)
        self.canvas.x2 = Int(x2.value)
        self.canvas.y2 = Int(y2.value)
        self.canvas.PCX1 = Int(puntoCx1.value)
        self.canvas.PCY1 = Int(puntoCy1.value)
        self.canvas.PCX2 = Int(puntoCx2.value)
        self.canvas.PCY2 = Int(puntoCy2.value)
        self.canvas.tipoCurva = .bezier
        self.canvas.setNeedsDisplay()
    }
    
    // Método para actualizar la curva de Bezier Cuadrática
    func actualizarCurvaQuadBezier() {
        self.canvas.x1 = Int(x1.value)
        self.canvas.y1 = Int(y1.value)
        self.canvas.x2 = Int(x2.value)
        self.canvas.y2 = Int(y2.value)
        self.canvas.PCX1 = Int(puntoCx1.value)
        self.canvas.PCY1 = Int(puntoCy1.value)
        self.canvas.tipoCurva = .bezierQuad
        self.canvas.setNeedsDisplay()
    }
    
    func actualizarGradiente1() {
        self.canvas.x1 = Int(x1.value)
        self.canvas.y1 = Int(y1.value)
        self.canvas.x2 = Int(x2.value)
        self.canvas.y2 = Int(y2.value)
        self.canvas.tipoCurva = .gradiente1
        self.canvas.setNeedsDisplay()
    }
    
    func actualizarGradiente2() {
        self.canvas.x1 = Int(x1.value)
        self.canvas.y1 = Int(y1.value)
        self.canvas.x2 = Int(x2.value)
        self.canvas.y2 = Int(y2.value)
        self.canvas.tipoCurva = .gradiente2
        self.canvas.setNeedsDisplay()
    }
    
    func actualizarDibujos() {
        switch self.canvas.tipoCurva {
        case .bezier:
            actualizarCurvaBezier()
        case .bezierQuad:
            actualizarCurvaQuadBezier()
        case .gradiente1:
            actualizarGradiente1()
        case .gradiente2:
            actualizarGradiente2()
        }
    }
    
    @IBAction func curvaSeleccionada(_ sender: UISegmentedControl) {
        
        let indice = sender.selectedSegmentIndex
        
        switch indice {
        case 0:
            actualizarCurvaBezier()
            puntoCx1.isEnabled = true
            puntoCy1.isEnabled = true
            
            puntoCx2.isEnabled = true
            puntoCy2.isEnabled = true
        case 1:
            actualizarCurvaQuadBezier()
            puntoCx2.isEnabled = false
            puntoCy2.isEnabled = false
        case 2:
            actualizarGradiente1()
            puntoCx1.isEnabled = false
            puntoCy1.isEnabled = false
            
            puntoCx2.isEnabled = false
            puntoCy2.isEnabled = false
        case 3:
            actualizarGradiente2()
            puntoCx1.isEnabled = false
            puntoCy1.isEnabled = false
            
            puntoCx2.isEnabled = false
            puntoCy2.isEnabled = false
        default:
            actualizarCurvaBezier()
            puntoCx1.isEnabled = true
            puntoCy1.isEnabled = true
            
            puntoCx2.isEnabled = true
            puntoCy2.isEnabled = true
        }
        
    }
    
    @IBAction func btnAnchoAlto(_ sender: UIButton) {
        
        lblAlto.text! += " " + String( canvas.alto )
        lblAncho.text! += " " + String ( canvas.ancho )
        
        btnAnchoAlto.isEnabled = false
        
    }
    
    @IBAction func x1(_ sender: UIStepper) {
        x1.value = sender.value
        
        actualizarDibujos()
        
    }
    
    @IBAction func y1(_ sender: UIStepper) {
        y1.value = sender.value
        
        actualizarDibujos()
    }
    
    @IBAction func x2(_ sender: UIStepper) {
        x2.value = sender.value
        
        actualizarDibujos()
    }
    
    @IBAction func t2(_ sender: UIStepper) {
        y2.value = sender.value
        
        actualizarDibujos()
    }
    
    @IBAction func puntoCx1(_ sender: UIStepper) {
        puntoCx1.value = sender.value
        
        actualizarDibujos()
    }
    
    @IBAction func puntoCy1(_ sender: UIStepper) {
        puntoCy1.value = sender.value
        
        actualizarDibujos()
    }
    
    @IBAction func puntoCx2(_ sender: UIStepper) {
        puntoCx2.value = sender.value
        
        actualizarDibujos()
    }
    
    @IBAction func puntoCy2(_ sender: UIStepper) {
        puntoCy2.value = sender.value
        
        actualizarDibujos()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
