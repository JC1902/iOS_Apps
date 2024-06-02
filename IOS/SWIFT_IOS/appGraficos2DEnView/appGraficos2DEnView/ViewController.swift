//
//  ViewController.swift
//  appGraficos2DEnView
//
//  Created by Jorge Cisneros on 30/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var canvas: CurvasBezier!
    
    @IBOutlet weak var x1: UITextField!
    @IBOutlet weak var y1: UITextField!
    @IBOutlet weak var x2: UITextField!
    @IBOutlet weak var y2: UITextField!
    
    @IBOutlet weak var puntoCx1: UITextField!
    @IBOutlet weak var puntoCx2: UITextField!
    @IBOutlet weak var puntoCy1: UITextField!
    @IBOutlet weak var puntoCy2: UITextField!
    
    @IBOutlet weak var lblAncho: UILabel!
    @IBOutlet weak var lblAlto: UILabel!
    
    @IBOutlet weak var btnAnchoAlto: UIButton!
    
    @IBAction func btnDibujarCurvaBezier(_ sender: UIButton) {
        
        self.canvas.x1 = Int( x1.text! )!
        self.canvas.y1 = Int( y1.text! )!
        
        self.canvas.x2 = Int( x2.text! )!
        self.canvas.y2 = Int( y2.text! )!
        
        canvas.PCX1 = Int( puntoCx1.text! )!
        canvas.PCY1 = Int( puntoCy1.text! )!
        
        canvas.PCX2 = Int( puntoCx2.text! )!
        canvas.PCY2 = Int( puntoCy2.text! )!
        
        canvas.tipoCurva = .bezier
        
        canvas.setNeedsDisplay()
        
    }
    
    @IBAction func btnDibujarCurvaQuadBezier(_ sender: UIButton) {
        
        self.canvas.x1 = Int( x1.text! )!
        self.canvas.y1 = Int( y1.text! )!
        
        self.canvas.x2 = Int( x2.text! )!
        self.canvas.y2 = Int( y2.text! )!
        
        canvas.PCX1 = Int( puntoCx1.text! )!
        canvas.PCY1 = Int( puntoCy1.text! )!
        
        canvas.tipoCurva = .bezierQuad
        
        canvas.setNeedsDisplay()
        
    }
    
    
    @IBAction func btnAnchoAlto(_ sender: UIButton) {
        
        lblAlto.text! += " " + String( canvas.alto )
        lblAncho.text! += " " + String ( canvas.ancho )
        
        btnAnchoAlto.isEnabled = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }


}

