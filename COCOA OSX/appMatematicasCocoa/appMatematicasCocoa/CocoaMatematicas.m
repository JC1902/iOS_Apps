//
//  CocoaMatematicas.m
//  appMatematicasCocoa
//
//  Created by Jorge on 06/03/24.
//

#import "CocoaMatematicas.h"
#include "Operaciones.h"

@implementation CocoaMatematicas

- (IBAction)botonNumeros:(NSButton *)sender {
    
    int boton = (int)sender.tag;
    
    switch ( boton ) {
        case 1:
            <#statements#>
            break;
        case 2:
            <#statements#>
            break;
        case 3:
            <#statements#>
            break;
        case 4:
            <#statements#>
            break;
        case 5:
            <#statements#>
            break;
        case 6:
            <#statements#>
            break;
        case 7:
            <#statements#>
            break;
        case 8:
            <#statements#>
            break;
        case 9:
            <#statements#>
            break;
        case 0:
            <#statements#>
            break;
        default:
            break;
    }
    
}

- ( void )awakeFromNib {
    // CONECTAR EL STEPPER AL TEXTFIELD
    _stepper_1.intValue = -15;
    _textoNum1.intValue = _stepper_1.intValue;
    
    //_sliderC1.intValue = 30;
    _textoNum2.intValue = _sliderC1.intValue = 30;
}

- (IBAction)stepper_1:(id)sender {
    
    NSBeep();
    
    _textoNum1.intValue = (int)_stepper_1.integerValue;
    
}
- (IBAction)botonSalir:(NSButton *)sender {
    NSBeep();
    NSAlert *alert = [[NSAlert alloc] init];
    [alert setMessageText:@"ADIOS 👾"];
    [alert setInformativeText:@"bye bye 👋"];
    [alert addButtonWithTitle:@"Cancelar 🙅‍♂️"]; // Boton cero
    [alert addButtonWithTitle:@"OK"];
    
    if ( [alert runModal] == NSAlertSecondButtonReturn )
        [NSApp terminate:self];
}

- (IBAction)botonRestar:(NSButton *)sender {
    
    NSNumber *n1 = [NSNumber numberWithInt:_textoNum1.intValue];
    NSNumber *n2 = [NSNumber numberWithInt:_textoNum2.intValue];
    
    Operaciones *mat = [[Operaciones alloc] init];
    
    NSNumber *result = [mat resta:n1 menos:n2];
    
    // [_etiquetaResultado setIntValue:result.intValue];
    _etiquetaResultado.intValue = result.intValue;
}

- (IBAction)botonSumar:(id)sender {
    
//    int n1 = _textoNum1.intValue;
//    int n2 = _textoNum2.intValue;
//    int result = n1 + n2;
//
//    [_etiquetaResultado setIntValue:result];
    
    NSNumber *n1 = [NSNumber numberWithInt:_textoNum1.intValue];
    NSNumber *n2 = [NSNumber numberWithInt:_textoNum2.intValue];
    
    Operaciones *mat = [[Operaciones alloc] init];
    
    NSNumber *result = [mat suma:n2 mas:n1];
    
    // [_etiquetaResultado setIntValue:result.intValue];
    _etiquetaResultado.intValue = result.intValue;
}

//double (^multiplicarDos)(double, double) =
//   ^(double num1, double num2) {
//      return num1 * num2;
//   };

- (IBAction)botonMultiplicar:(NSButton *)sender {
    
    double (^multiplicarDos)(double, double) =
       ^(double num1, double num2) {
          return num1 * num2;
       };
    
    int n1 = _textoNum1.intValue;
    int n2 = _textoNum2.intValue;
    int result = multiplicarDos(n1, n2);
    [_etiquetaResultado setIntValue:result];
    
}

- (IBAction)botonTangente:(NSButton *)sender {
    
    NSNumber *angulo = [NSNumber numberWithDouble:_textoNum1.doubleValue];
    
    Operaciones *mat = [[Operaciones alloc] init];
    
    NSNumber *result = [mat tan:angulo];
    
    [_etiquetaResultado setDoubleValue:result.doubleValue];
    
}

- (IBAction)botonCoseno:(NSButton *)sender {
    
    NSNumber *angulo = [NSNumber numberWithDouble:_textoNum1.doubleValue];
    
    Operaciones *mat = [[Operaciones alloc] init];
    
    NSNumber *result = [mat cos:angulo];
    
    [_etiquetaResultado setDoubleValue:result.doubleValue];
    
}

- (IBAction)botonSeno:(NSButton *)sender {
    
    NSNumber *angulo = [NSNumber numberWithDouble:_textoNum1.doubleValue];
    
    Operaciones *mat = [[Operaciones alloc] init];
    
    NSNumber *result = [mat sen:angulo];
    
    [_etiquetaResultado setDoubleValue:result.doubleValue];
    
}

- (IBAction)botonClear:(NSButton *)sender {
    
    _stepper_1.intValue = 0;
    _textoNum1.intValue = _stepper_1.intValue;
    
    //_sliderC1.intValue = 30;
    _textoNum2.intValue = _sliderC1.intValue = 0;
    
    [_etiquetaResultado setIntValue:0];
}

- (IBAction)botonEsBisiesto:(NSButton *)sender {
    
    int num = _textoNum1.intValue;
    
    Operaciones *mat = [Operaciones new];
    
    BOOL result = [mat esBisiesto:num];
    
    if ( result ) {
        [_etiquetaResultado setStringValue:@"Es Año Bisiesto"];
    } else {
        [_etiquetaResultado setStringValue:@"No Es Año Bisiesto"];
    }
    
}

- (IBAction)botonEsPrimo:(NSButton *)sender {
    
    int num = _textoNum1.intValue;
    
    Operaciones *mat = [Operaciones new];
    
    BOOL result = [mat esPrimo:num];
    
    if ( result ) {
        [_etiquetaResultado setStringValue:@"Es Primo"];
    } else {
        [_etiquetaResultado setStringValue:@"No Es Primo"];
    }
    
}

- (IBAction)botonFactorial:(NSButton *)sender {
    
    int num1 = _textoNum1.intValue;
    
    Operaciones *mat = [[Operaciones alloc] init];
    
    double result = [mat factorial:num1];
    
    [_etiquetaResultado setDoubleValue:result];
    
}

- (IBAction)botonResiduo:(NSButton *)sender {
    
    int n1 = _textoNum1.intValue;
    int n2 = _textoNum2.intValue;
    
    Operaciones *mat = [[Operaciones alloc] init];
    
    int result = [mat obtenResiduo:n1 entre:n2];
    
    // [_etiquetaResultado setIntValue:result.intValue];
    _etiquetaResultado.intValue = result;
    
}

- (IBAction)botonDividir:(NSButton *)sender {
    
    NSNumber *n1 = [NSNumber numberWithInt:_textoNum1.doubleValue];
    NSNumber *n2 = [NSNumber numberWithInt:_textoNum2.doubleValue];
    
    Operaciones *mat = [[Operaciones alloc] init];
    
    NSNumber *result = [mat divide:n1 entre:n2];
    
    // [_etiquetaResultado setIntValue:result.intValue];
    _etiquetaResultado.doubleValue = result.doubleValue;
    
}

- (IBAction)sliderC1:(NSSlider *)sender {
    NSBeep();
    [_textoNum2 setIntValue:[_sliderC1 intValue]];
}
@end
