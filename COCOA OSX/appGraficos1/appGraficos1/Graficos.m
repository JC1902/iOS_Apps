//
//  Graficos.m
//  appGraficos1
//
//  Created by Jorge on 15/03/24.
//

#import "Graficos.h"

@implementation Graficos

-(NSPoint) puntosAleatorios {
    
    NSPoint result;
    NSRect rec = [self bounds];
    
    result.x = rec.origin.x + random() % (int)rec.size.width;
    result.y = rec.origin.y + random() % (int)rec.size.height;
    
    return result;
    
}

- (void)drawRect:(NSRect)dirtyRect {
    
    [ super drawRect:dirtyRect ];
        
    // Drawing code here.
        
    NSRect rectangulo = [ self bounds ];
    //[ [ NSColor blueColor ] set ];
    [[NSColor colorWithDeviceRed:0.1f green:0.785f blue:0.785f alpha:1.0f] set ];
    // DEFINIENDO UNA VARIABLE
    //NSColor *miColor = [ NSColor colorWithCalibratedRed:0.0 green:0,5 blue:0 alpha:1.0 ];
    //[ miColor set ];
        
    [ NSBezierPath fillRect:rectangulo ];//PINTAMOS EL RECTANGULO
    
//    [ self dibujaLineas ];
//    [ self dibujaLinea ];
//    [self dibujaTriangulo];
//    [self dibujaEstrella];
//    [self dibujaPentagono];
//    [self dibujarGradienteRadial];
    [self dibujarCurvaBezier1];
    [self dibujarCurvaBezier2];
}

- ( void ) dibujaTriangulo {
    
    [[ NSColor orangeColor ] set ];
    NSBezierPath *path = [[NSBezierPath alloc] init];
    
    [path setLineWidth:2.5];
    
    /*int fig[4][3] = {{5,5}, {100,5}, {5,100}, {5,5}};
    
    NSPoint punto;
    
    punto.x = fig[0][0];
    punto.y = fig[0][1];
    
    [path moveToPoint:punto];
    
    for ( int i = 1; i < 4; i++) {
        punto.x = fig[i][0];
        punto.y = fig[i][1];
        
        [path lineToPoint:punto];
    }*/
    
    NSPoint punto;
    punto.x = 5;
    punto.y = 5;
    
    [path moveToPoint:punto];
    
    punto.x = 100;
    punto.y = 5;
    
    [path lineToPoint:punto];
    
    punto.x = 5;
    punto.y = 100;
    
    [path lineToPoint:punto];
    
    punto.x = 5;
    punto.y = 5;
    
    [path lineToPoint:punto];
    
    
    [path stroke];
    [path fill];
}

- ( void ) dibujaEstrella {
    
    [[NSColor colorWithDeviceRed:0.1f green:0.285f blue:0.785f alpha:1.0f] set ];
    NSBezierPath *path = [[NSBezierPath alloc] init];
    
    [path setLineWidth:2.0];
    
    int fig[6][3] = { {0,0}, {self.bounds.size.width/2, self.bounds.size.height}, {self.bounds.size.width,0}, {0,self.bounds.size.height/2}, {self.bounds.size.width,self.bounds.size.height/2}, {0,0} };
    
    NSPoint punto;
    
    punto.x = fig[0][0];
    punto.y = fig[0][1];
    
    [path moveToPoint:punto];
    
    for ( int i = 1; i < 6; i++) {
        punto.x = fig[i][0];
        punto.y = fig[i][1];
        
        [path lineToPoint:punto];
    }
    
    [path stroke];
    
}

- ( void ) dibujaPentagono {
    
    [[NSColor colorWithDeviceRed:0.1f green:0.585f blue:0.285f alpha:1.0f] set ];
    NSBezierPath *path = [[NSBezierPath alloc] init];
    
    [path setLineWidth:2.0];
    
    int fig[6][3] = { {0, self.bounds.size.height/2}, {self.bounds.size.width/2, self.bounds.size.height}, {self.bounds.size.width, self.bounds.size.height/2}, {(self.bounds.size.width/2)+130, 0}, {(self.bounds.size.width/2)-130, 0}, {0, self.bounds.size.height/2} };
    
    NSPoint punto;
    
    punto.x = fig[0][0];
    punto.y = fig[0][1];
    
    [path moveToPoint:punto];
    
    for ( int i = 1; i < 6; i++) {
        punto.x = fig[i][0];
        punto.y = fig[i][1];
        
        [path lineToPoint:punto];
    }
    
    [path stroke];
    
}

- ( void ) dibujaLineas {
    
    [ [ NSColor whiteColor ] set ];
    NSBezierPath *path = [ [ NSBezierPath alloc ] init ];
    srandom( ( unsigned )time( NULL ) );
    
    
    [ path setLineWidth:3.0 ];
    
    NSPoint p = [ self puntosAleatorios ];;
    
    [ path moveToPoint:p ];
    
    for( int i = 0; i < 20;i++ )
    {
        p = [ self puntosAleatorios ];
        [ path lineToPoint:p ];
    }
        
    [ path stroke ];// DIBUJA LAS LINEA
    [ path fill ]; //RELLENO DE POLIGONOS CONVEXOS
    
}

- ( void ) dibujaLinea {
    [ [ NSColor blueColor ] set ];
    [ NSBezierPath setDefaultLineCapStyle:NSLineCapStyleButt ];
    
    NSBezierPath *path = [ NSBezierPath bezierPath ];
    [ path setLineWidth:5.5 ];
    [ path moveToPoint:NSMakePoint( 0.0, 0.0) ];
    [ path lineToPoint:NSMakePoint( self.bounds.size.width/2.0, self.bounds.size.height/2.0 ) ];
    //[ path setLineCapStyle:NSLineCapStyleRound ];
    [ path setLineCapStyle:NSLineCapStyleSquare ];
    
    [ path stroke ];
    
}

- ( void ) dibujarGradienteRadial {
    
    NSRect bounds = [ self bounds ];
    NSGradient *gradiente = [ [ NSGradient alloc ] initWithStartingColor:[ NSColor yellowColor ] endingColor:[ NSColor redColor ] ];
    
    NSPoint centerPoint = NSMakePoint( NSMidX(bounds), NSMidY(bounds) );
    NSPoint otherPoint = NSMakePoint( centerPoint.x + 60, centerPoint.y + 60 );
    
    CGFloat firstRadius = MIN( ( (bounds.size.width/2.0) - 2.0 ), ( ( bounds.size.height/2.0 ) -2.0) );
    
    [ gradiente drawFromCenter:centerPoint radius:firstRadius toCenter:otherPoint radius:2.0 options:0 ];
    
    [self dibujaTriangulo];
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

- ( void ) dibujarCurvaBezier2 {
    
    [[ NSColor orangeColor ] set ];
    
    NSPoint p1 = NSMakePoint( 100.0, 100.0 );
    NSPoint p2 = NSMakePoint( 200.0, 300.0 );
    NSPoint p3 = NSMakePoint( 300.0, 100.0 );
    
    // PUNTOS DE CONTROL
    NSPoint c1 = NSMakePoint( 200.0, 200.0 );
    NSPoint c2 = NSMakePoint( 200.0, 0.0 );
    
    // CONsTRUIMOS EL PATH PARA EL TRIANGULO
    NSBezierPath *bezier = [ NSBezierPath bezierPath ];
    [ bezier moveToPoint:p1 ];
    [ bezier lineToPoint:p2 ];
    [ bezier lineToPoint:p3 ];
    [ bezier curveToPoint:p1 controlPoint1:c1 controlPoint2:c2 ];
    [ bezier closePath ];
    
    [ bezier setLineWidth:2.0 ];
    [ bezier setLineCapStyle:NSLineCapStyleRound ];
    [ bezier setLineJoinStyle:NSLineJoinStyleMiter ];
    
    [ bezier stroke ];
    
    [[ NSColor whiteColor ] set ];
    [ bezier fill ];
    
}

@end
