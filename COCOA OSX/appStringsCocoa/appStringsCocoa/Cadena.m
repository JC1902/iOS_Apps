//
//  Cadena.m
//  appStringsCocoa
//
//  Created by Jorge on 15/03/24.
//

#import "Cadena.h"

@implementation Cadena

-(IBAction)botonSaludar:(id)sender {
    
//    NSString *cad = textoEntrada.stringValue;
//    etiquetaSaludar.stringValue = cad;
    
    //OPCION 2
//    NSString *cad = [@"Hola " stringByAppendingString:textoEntrada.stringValue];
//
//    etiquetaSaludar.stringValue = cad;
    
    //OPCION 3
    etiquetaSaludar.stringValue = [@"Hola " stringByAppendingString:textoEntrada.stringValue];
    
}

-(IBAction)botonContarCaracteres:(id)sender {
    unsigned long int cantCar = textoEntrada.stringValue.length;
    
    etiquetaCaracteres.intValue = (int)cantCar;
}

- (IBAction)botonConvertirAMayusculas:(id)sender {
}

-(IBAction)botonCantMayusculas:(NSButton *)sender {
    
    
    
}

@end
