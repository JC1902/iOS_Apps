//
//  CurvasBezier.swift
//  appTabBarViewController
//
//  Created by Jorge Cisneros on 08/06/24.
//

import UIKit

class CurvasBezier: UIView {

    public var x1 : Int = 0
    internal var y1 : Int = 0
    public var x2 : Int = 0
    public var y2 : Int = 0
    
    
    internal var PCX1 : Int = 0
    public var PCY1 : Int = 0
    public var PCX2 : Int = 0
    public var PCY2 : Int = 0
    
    public var ancho : Int = 0
    public var alto : Int = 0
    
    public enum TipoCurva {
        
        case bezier
        case bezierQuad
        
    }
    
    public var tipoCurva: TipoCurva = .bezier
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        let canvas = UIGraphicsGetCurrentContext()
        
        canvas?.setLineWidth(3.0)
        canvas?.setStrokeColor( #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) )
        
        ancho = Int( rect.width )
        alto = Int( rect.height )
        
        switch tipoCurva {
        case .bezier:
            bezier( canvas! )
            break
        case .bezierQuad:
            bezierQuad( canvas! )
            break
        }
        
    }
    
    func bezier ( _ canvas : CGContext ) {
        // CURVAS DE BEZIER
        canvas.move(to: CGPoint(x: x1, y: y1))
        canvas.addCurve(to: CGPoint(x: x2, y: y2), control1: CGPoint(x: PCX1, y: PCY1), control2: CGPoint(x: PCX2, y: PCY2))
        canvas.strokePath()
    }
    
    func bezierQuad ( _ canvas : CGContext ) {
        // CURVAS DE BEZIER
        canvas.move(to: CGPoint(x: x1, y: y1))
        canvas.addQuadCurve(to: CGPoint(x: x2, y: y2), control: CGPoint(x: PCX1, y: PCY1))
        canvas.strokePath()
    }

}
