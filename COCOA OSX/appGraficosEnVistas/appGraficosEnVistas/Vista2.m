//
//  Vista2.m
//  appGraficosEnVistas
//
//  Created by Jorge on 21/03/24.
//

#import "Vista2.h"

@implementation Vista2

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSRect rec = [self bounds];
    
    [self dibujaEstrella ];
    
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

@end
