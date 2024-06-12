//
//  ViewController.h
//  appTimer
//
//  Created by Jorge on 12/03/24.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
{
    NSTimer *timer;
    int cont;
}

@property (weak) IBOutlet NSButton *botonIniciar;

@property (weak) IBOutlet NSTextField *labResultado;

- (IBAction)botonIniciar:(NSButton *)sender;

@property (weak) IBOutlet NSButton *botonDetener;

- (IBAction)botonDetener:(NSButton *)sender;

@property (weak) IBOutlet NSButton *botonReiniciar;

- (IBAction)botonReiniciar:(NSButton *)sender;

- (IBAction)botonSalir:(NSButton *)sender;

@end

