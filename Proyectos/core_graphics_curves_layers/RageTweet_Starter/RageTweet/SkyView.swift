/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class SkyView: UIView {
  private var rageLevel: RageLevel = .happy

  func setRageLevel(_ rageLevel: RageLevel) {
    self.rageLevel = rageLevel
    setNeedsDisplay()
  }
  
  override func draw(_ rect: CGRect) {
    
    guard let context = UIGraphicsGetCurrentContext() else {
      return
    }
    
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    
    drawSky(in: rect, context: context, colorSpace: colorSpace)
    drawMountains(in: rect, in: context, with: colorSpace)
    //  drawGrass(in: rect, in: context, with: colorSpace)
    //  drawFlowers(in: rect, in: context, with: colorSpace)
    
  }
  
  private func drawSky( in rect: CGRect, context: CGContext, colorSpace: CGColorSpace? ) {
    
    context.saveGState()
    defer { context.restoreGState() }
    
    let baseColor = UIColor( red: 148.0 / 255.0, green: 158.0 / 255.0, blue: 183.0 / 255.0, alpha: 1.0 )
    let middleStop = UIColor( red: 127.0 / 255.0, green: 138.0 / 255.0, blue: 166.0 / 255.0, alpha: 1.0 )
    let farStop = UIColor( red: 96.0 / 255.0, green: 111.0 / 255.0, blue: 144.0 / 255.0, alpha: 1.0 )
    
    let gradientColors = [ baseColor.cgColor, middleStop.cgColor, farStop.cgColor ]
    let locations: [ CGFloat ] = [ 0.0, 0.1, 0.25 ]
    
    guard let gradient = CGGradient(
            colorsSpace: colorSpace,
            colors: gradientColors as CFArray,
            locations: locations
    ) else {
      return
    }
    
    let startPoint = CGPoint( x: rect.size.height / 2, y: 0 )
    let endPoint = CGPoint( x: rect.size.height / 2, y: rect.size.width )
    
    context.drawLinearGradient( gradient, start: startPoint, end: endPoint, options: [] )
    
  }
  
  private func drawMountains( in rect: CGRect, in context: CGContext, with colorSpace: CGColorSpace? ) {
    
    let darkColor = UIColor( red: 1.0 / 255.0, green: 93.0 / 255.0, blue: 67.0 / 255.0, alpha: 1 )
    let lightColor = UIColor( red: 63.0 / 255.0, green: 109.0 / 255.0, blue: 79.0 / 255.0, alpha: 1 )
    let rectWidth = rect.size.width
    
    let mountainsColors = [ darkColor.cgColor, lightColor.cgColor ]
    let mountainLocations: [ CGFloat ] = [ 0.1, 0.2 ]
    guard let mountainGrad = CGGradient.init(
            colorsSpace: colorSpace,
            colors: mountainsColors as CFArray,
            locations: mountainLocations
    ) else {
      return
    }
    
    let mountainStart = CGPoint( x: rect.size.height / 2, y: 100 )
    let mountainEnd = CGPoint( x: rect.size.height / 2, y: rect.size.width )
    
    context.saveGState()
    defer { context.restoreGState() }
    
    let backgroundMountains = CGMutablePath()
    
    backgroundMountains.move( to: CGPoint( x: -5, y: 157 ), transform: .identity )
    backgroundMountains.addQuadCurve(to: CGPoint( x: 77, y: 157 ), control: CGPoint( x: 30, y: 129 ), transform: .identity )
    
    backgroundMountains.addCurve( to: CGPoint( x: 303, y: 125 ), control1: CGPoint( x: 190, y: 210 ), control2: CGPoint( x: 200, y: 70 ), transform: .identity )
    
    backgroundMountains.addQuadCurve( to: CGPoint( x: 350, y: 150 ), control: CGPoint( x: 340, y: 150 ), transform: .identity )
    backgroundMountains.addQuadCurve( to: CGPoint( x: 410, y: 145 ), control: CGPoint( x: 380, y: 155 ), transform: .identity )
    backgroundMountains.addCurve( to: CGPoint( x: rectWidth, y: 165 ), control1: CGPoint( x: rectWidth - 90, y: 100 ), control2: CGPoint( x: rectWidth - 50, y: 190 ), transform: .identity )
    backgroundMountains.addLine( to: CGPoint( x: rectWidth - 10, y: rect.size.width ), transform: .identity )
    backgroundMountains.addLine( to: CGPoint( x: -5, y: rect.size.width ), transform: .identity )
    backgroundMountains.closeSubpath()
    
    context.addPath( backgroundMountains )
    context.clip()
    context.drawLinearGradient( mountainGrad, start: mountainStart, end: mountainEnd, options: [] )
    context.setLineWidth( 4 )
    
    // Background Mountain Stroking
    context.addPath( backgroundMountains )
    context.setStrokeColor( UIColor.black.cgColor )
    context.strokePath()
    
    // Foreground Mountains
    let foregroundMountains = CGMutablePath()
    
    foregroundMountains.move( to: CGPoint( x: -5, y: 190 ), transform: .identity )
    foregroundMountains.addCurve( to: CGPoint( x: 303, y: 190 ), control1: CGPoint( x: 160, y: 250 ), control2: CGPoint( x: 200, y: 140 ), transform: .identity )
    foregroundMountains.addCurve(to: CGPoint(x: rectWidth, y: 210),
                                 control1: CGPoint(x: rectWidth - 150, y: 250),
                                 control2: CGPoint(x: rectWidth - 50, y: 170),
                                 transform: .identity)
    foregroundMountains.addLine(to: CGPoint(x: rectWidth, y: 230),
                                transform: .identity)
    foregroundMountains.addCurve(to: CGPoint(x: -5, y: 225),
                                 control1: CGPoint(x: 300, y: 260),
                                 control2: CGPoint(x: 140, y: 215),
                                 transform: .identity)
    foregroundMountains.closeSubpath()
    
    // Foreground Mountain drawing
    context.addPath( foregroundMountains )
    context.clip()
    context.setFillColor( darkColor.cgColor )
    context.fill( CGRect( x: 0, y: 170, width: rectWidth, height: 90 ) )
    
    // Foreground Mountain stroking
    context.addPath( foregroundMountains )
    context.setStrokeColor( UIColor.black.cgColor )
    context.strokePath()
    
  }
  
}
