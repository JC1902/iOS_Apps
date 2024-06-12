//
//  Graficos2d.swift
//  appGraficos2D
//
//  Created by Jorge Cisneros on 28/05/24.
//

import UIKit

class Graficos2D: UIView {

    let canvas = UIGraphicsGetCurrentContext()
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        canvas?.setLineWidth(3.0)
//       // canvas?.setStrokeColor(UIColor.blue.cgColor)
//
//        canvas?.setStrokeColor( #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) )
//
//        canvas?.move(to: CGPoint(x: 50, y: 50))
//        canvas?.addLine(to: CGPoint(x: rect.width - 50, y: rect.height-50))
//
//        canvas?.strokePath()
//
//        let colorSpace =  CGColorSpaceCreateDeviceRGB()
//        let componentes:[CGFloat] = [CGFloat(Float.random(in: 0.0..<1.0)),CGFloat(drand48()),0.0, 1.0]
//        let color = CGColor(colorSpace: colorSpace, components: componentes)
//
//        canvas?.setStrokeColor(color!)
//        canvas?.move(to:CGPoint(x: 0, y: 0))
//        canvas?.addLine(to: CGPoint(x: 200, y: 200))
//        canvas?.strokePath()
        
        //bezier( rect )
        gradientes(rect)
        
        
        
    }
    
    func rectangulo( _ rect: CGRect ) {
        // RECTANGULO
        // let rectangulo = CGRect(x: rect.midX, y: rect.midY, width: rect.width - 10, height: rect.height / 2)
        let rectangulo = CGRect(x: rect.width/2, y: rect.height/2, width: 100.0, height: 100.0 )
        
        canvas?.addRect( rectangulo )
        canvas?.strokePath()
        canvas?.setFillColor( #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1) )
        canvas?.fill( rectangulo )
    }
    
    func bezier ( _ rect: CGRect ) {
        // CURVAS DE BEZIER
        canvas?.move(to: CGPoint(x: 10.0, y: 100.0))
        canvas?.addCurve(to: CGPoint(x: rect.width - 10.0, y: 100.0), control1: CGPoint(x: rect.width - 10, y: 50.0), control2: CGPoint(x: rect.width + 10, y: 150.0))
        canvas?.strokePath()
    }
    
    func gradientes( _ rect: CGRect ) {
        
        let posicion1 : [CGFloat] = [ 0.0, 0.5, 1.0 ]
        let colores = [ #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) ]
        
        let colorSpace1 = CGColorSpaceCreateDeviceRGB()
        let gradiente = CGGradient(colorsSpace: colorSpace1, colors: colores as CFArray, locations: posicion1)
        
        var startPoint = CGPoint()
        
        var endPoint = CGPoint()
        
        startPoint.x = 150.0
        startPoint.y = 300.0
        
        endPoint.x = 300
        endPoint.y = 400
        
        let startRadio : CGFloat = 10.0
        let endRadio : CGFloat = 75.5
        
        canvas?.drawRadialGradient(gradiente!, startCenter: startPoint, startRadius: startRadio, endCenter: endPoint, endRadius: endRadio, options: CGGradientDrawingOptions.drawsAfterEndLocation)
        
    }
    

}
