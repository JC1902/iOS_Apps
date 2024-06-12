//
//  Vista4.m
//  appGraficosEnVistas
//
//  Created by Jorge on 21/03/24.
//

#import "Vista4.h"

@implementation Vista4

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSRect rec = [self bounds];
    
    [self dibujarCurvaBezier1 ];
}

- ( void ) dibujarCurvaBezier1 {
    
    [ [ NSColor blueColor ] set];
    NSBezierPath *path = [ NSBezierPath bezierPath ];
    
    [ path setLineWidth:5.0 ];
    [ path moveToPoint:NSMakePoint(0.0, 0.0) ];
    [ path lineToPoint:NSMakePoint(100.0, 100.0) ];
    [ path curveToPoint:NSMakePoint(380.0, 410.0) controlPoint1:NSMakePoint(10.0, 30.0) controlPoint2:NSMakePoint(380.0, 140.0) ];
    
    [ path appendBezierPathWithRect:NSMakeRect(20.0, 160.0, 80.0, 50.0) ];
    
    [ path setLineCapStyle:NSLineCapStyleRound ];
    [ path setLineJoinStyle:NSLineJoinStyleMiter ];
    
    [ path stroke ];
    
}

@end
