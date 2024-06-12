//
//  Vista3.m
//  appGraficosEnVistas
//
//  Created by Jorge on 21/03/24.
//

#import "Vista3.h"

@implementation Vista3

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSRect rec = [self bounds];
    
    [self dibujaTriangulo ];
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

@end
