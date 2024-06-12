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
        case gradiente1
        case gradiente2
        
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
        case .gradiente1:
            gradiente1( canvas! )
            break
        case .gradiente2:
            gradiente2( canvas! )
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
    
    func gradiente1( _ canvas: CGContext ) {
        let posicion : [CGFloat] = [0.0, 0.5, 1.0]
        
        let colores: [CGColor] = [ #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1) ]
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradiente = CGGradient(colorsSpace: colorSpace, colors: colores as CFArray, locations: posicion)
        
        let startRadio: CGFloat = 10.0
        let endRadio: CGFloat = 75.0
        
        canvas.drawRadialGradient(gradiente!, startCenter: CGPoint(x: x1, y: y1), startRadius: startRadio, endCenter: CGPoint(x: x2, y: y2), endRadius: endRadio, options: CGGradientDrawingOptions.drawsAfterEndLocation )
    }
    
    func gradiente2( _ canvas: CGContext ) {
        let posicion : [CGFloat] = [0.0, 0.5, 1.0]
        
        let colores: [CGColor] = [ #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1) ]
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradiente = CGGradient(colorsSpace: colorSpace, colors: colores as CFArray, locations: posicion)
        
        canvas.drawLinearGradient(gradiente!, start: CGPoint(x: x1, y: y1), end: CGPoint(x: x2, y: y2), options: CGGradientDrawingOptions.drawsBeforeStartLocation)
    }

}
