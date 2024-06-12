//
//  DibujarConTouch.m
//  appDibujarEnVista
//
//  Created by Jorge Cisneros on 16/05/24.
//

#import "DibujarConTouch.h"

#import "DibujarConTouch.h"

@implementation DibujarConTouch {
    UIBezierPath *path;
}

- (id)initWithCoder:(NSCoder *)Decoder {
    if ( self = [super initWithCoder:Decoder]) {
        [self setMultipleTouchEnabled:NO];
        [self setBackgroundColor:[UIColor whiteColor]];
        path = [UIBezierPath bezierPath];
        [path setLineWidth:2.0];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    [[UIColor colorWithRed:0 green:0 blue:0.75 alpha:1.0] setStroke];
    
    [path stroke];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    CGPoint punto = [touch locationInView:self];
    
    [path moveToPoint:punto];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    CGPoint punto = [touch locationInView:self];
    
    [path addLineToPoint:punto];
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesMoved:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
}

@end
