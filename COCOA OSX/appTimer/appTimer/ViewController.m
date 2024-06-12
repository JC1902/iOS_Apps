//
//  ViewController.m
//  appTimer
//
//  Created by Jorge on 12/03/24.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    cont = 0;
    _botonDetener.enabled = NO;
    _botonReiniciar.enabled = NO;
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

-(void) contador {
    [_labResultado setIntValue:cont];
    cont++;
}

- (IBAction)botonIniciar:(NSButton *)sender {
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(contador) userInfo:nil repeats:YES];
    
    [_botonIniciar setEnabled:NO];
    _botonDetener.enabled = YES;
    _botonReiniciar.enabled = NO;
    
}

- (IBAction)botonDetener:(NSButton *)sender {
    [_botonReiniciar setEnabled:YES];
    [_botonIniciar setEnabled:YES];
    [_botonDetener setEnabled:NO];
    
    [timer invalidate];
    
    [_labResultado setStringValue:@"Presionó detener"];
    
}

- (IBAction)botonSalir:(NSButton *)sender {
    [NSApp terminate:self];
}

- (IBAction)botonReiniciar:(NSButton *)sender {
    [timer invalidate]; // DETENER EL TIMER
    
    [_labResultado setStringValue:@"Presionó reiniciar"];
    
    cont = 0;
    
}

@end
