//
//  Vista1.m
//  appGraficosEnVistas
//
//  Created by Jorge on 21/03/24.
//

#import "Vista1.h"

@implementation Vista1

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSRect rec = [self bounds];
    
    [self dibujarGradienteRadial ];
    
}

/*
 dibujar en varias vistas los objetos que utilizamos
 */

- ( void ) dibujarGradienteRadial {
    
    NSRect bounds = [ self bounds ];
    NSGradient *gradiente = [ [ NSGradient alloc ] initWithStartingColor:[ NSColor yellowColor ] endingColor:[ NSColor redColor ] ];
    
    NSPoint centerPoint = NSMakePoint( NSMidX(bounds), NSMidY(bounds) );
    NSPoint otherPoint = NSMakePoint( centerPoint.x + 60, centerPoint.y + 60 );
    
    CGFloat firstRadius = MIN( ( (bounds.size.width/2.0) - 2.0 ), ( ( bounds.size.height/2.0 ) -2.0) );
    
    [ gradiente drawFromCenter:centerPoint radius:firstRadius toCenter:otherPoint radius:2.0 options:0 ];
    
}

@end
