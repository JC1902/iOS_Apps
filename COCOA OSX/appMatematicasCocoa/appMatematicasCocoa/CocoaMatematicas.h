//
//  CocoaMatematicas.h
//  appMatematicasCocoa
//
//  Created by Jorge on 06/03/24.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface CocoaMatematicas : NSObject

{
    // AQUI VAN LOS ATRIBUTOS
}

// TEXTFIELDS
@property (weak) IBOutlet NSTextField *textoNum1;

@property (weak) IBOutlet NSTextField *textoNum2;

@property (weak) IBOutlet NSTextField *etiquetaResultado;

// STEPPER
@property (weak) IBOutlet NSStepper *stepper_1;
- (IBAction)stepper_1:(id)sender;

// SLIDER
@property (weak) IBOutlet NSSlider *sliderC1;
- (IBAction)sliderC1:(NSSlider *)sender;

// BOTONES OPERACIONES
- (IBAction)botonSumar:(id)sender;
- (IBAction)botonRestar:(NSButton *)sender;
- (IBAction)botonMultiplicar:(NSButton *)sender;
- (IBAction)botonDividir:(NSButton *)sender;
- (IBAction)botonResiduo:(NSButton *)sender;
- (IBAction)botonFactorial:(NSButton *)sender;
- (IBAction)botonEsPrimo:(NSButton *)sender;
- (IBAction)botonEsBisiesto:(NSButton *)sender;
- (IBAction)botonClear:(NSButton *)sender;
- (IBAction)botonSeno:(NSButton *)sender;
- (IBAction)botonCoseno:(NSButton *)sender;
- (IBAction)botonTangente:(NSButton *)sender;

// BOTONES FUNCIONALIDAD
- (IBAction)botonSalir:(NSButton *)sender;

- ( void )awakeFromNib;

- (IBAction)botonNumeros:(NSButton *)sender;

@property (weak) IBOutlet NSTextField *etiqResultado;

@end

NS_ASSUME_NONNULL_END
