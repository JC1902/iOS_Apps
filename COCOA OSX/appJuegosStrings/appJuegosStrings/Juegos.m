//
//  Juegos.m
//  appJuegosStrings
//
//  Created by Jorge on 15/03/24.
//

#import "Juegos.h"

@implementation Juegos

NSMutableString * (^quitarLetras)( NSMutableString * ) =
    ^( NSMutableString *palabra ) {
        NSMutableString *palabraMutable = [ palabra mutableCopy ];
        int letrasAQuitar = 3;
        unsigned long int posLetra;
        
        if ( [palabra length] <= 4 )
            letrasAQuitar = 2;
        else if ( [palabra length] > 4 && [ palabra length ] <= 15 )
            letrasAQuitar = 4;
        
        for ( int i = 0; i < letrasAQuitar; i++ ) {
            posLetra = (int)arc4random_uniform( [ palabraMutable length ] );
            
            [palabraMutable replaceCharactersInRange:NSMakeRange(posLetra, 1) withString:@"*"];
        }
        
        return palabraMutable;
    };

//-----------------------------------------------------------------------------------------

NSMutableString * (^invertirPalabra)( NSMutableString * ) =
   ^( NSMutableString *palabra ) {
       NSMutableString *cadAux = [[NSMutableString alloc] init];
       unsigned long int largo = [palabra length];
       char caracter;
       
       for( int i = (int)largo-1; i >= 0; i-- ) {
           caracter = [palabra characterAtIndex:i];
           [cadAux appendFormat:@"%c", caracter];
       }
       
       return cadAux;
};

//-----------------------------------------------------------------------------------------

NSMutableString * (^desordenarPalabra) ( NSMutableString * ) =
    ^( NSMutableString *palabra ) {
        unsigned long largo = [palabra length];
        NSMutableArray *caracteres = [NSMutableArray arrayWithCapacity:largo];
        NSString *caracter;
        NSMutableString *stringResultante = [NSMutableString string];
        unsigned long contador;
        unsigned long resto, nuevoIndex;
        
        for( int i = 0; i < largo; i++ ) {
            caracter = [NSString stringWithFormat:@"%c", [palabra characterAtIndex:i]];
            [caracteres addObject:caracter];
        }
        
        contador = [caracteres count];
        
        for ( int i = 0; i < contador; i++ ) {
            resto = contador - i;
            nuevoIndex = i + arc4random_uniform(resto);
            [caracteres exchangeObjectAtIndex:i withObjectAtIndex:nuevoIndex];
        }
        
        for ( NSString *caracter in caracteres ) {
            [stringResultante appendString:caracter];
        }
        
        return stringResultante;
    };

//-----------------------------------------------------------------------------------------

- (IBAction)botonSalir:(NSButton *)sender {
    [NSApp terminate:self];
}

- (IBAction)botonRespuesta:(NSButton *)sender {
    
    entradaUsuario.stringValue = [entradaUsuario.stringValue lowercaseString];
    
    if ( [entradaUsuario.stringValue isEqualToString:palabra] ) {
        etiquetaResultado.stringValue = @"Acertaste!!";
        [imgCorrecto setHidden:NO];
        [imgIncorrecto setHidden:YES];
    } else {
        etiquetaResultado.stringValue = @"Intenta de nuevo";
        [imgCorrecto setHidden:YES];
        [imgIncorrecto setHidden:NO];
    }
}

- (IBAction)botonPlay:(NSButton *)sender {
    
    [imgCorrecto setHidden:YES];
    [imgIncorrecto setHidden:YES];
    etiquetaResultado.stringValue = @"";
    [botonRespuesta setEnabled:YES];
    
    NSMutableArray *palabras = [NSMutableArray arrayWithObjects: @"perro", @"celular", @"payaso", @"pixel", @"canica", @"medalla", @"peluche", @"instrumento", @"rojo", nil];
    
    palabra = palabras[random() % [palabras count]];
    
    long int seleccion = selectorJuegos.selectedSegment;
    
    switch ( seleccion ) {
        case 0:
            etiquetaPalabra.stringValue = invertirPalabra(palabra);
            break;
        case 1:
            etiquetaPalabra.stringValue = desordenarPalabra(palabra);
            break;
        case 2:
            etiquetaPalabra.stringValue = quitarLetras(palabra);
            break;
    }
    
}

- (IBAction)selectorJuegos:(NSSegmentedCell *)sender {
    long int seleccion = selectorJuegos.selectedSegment;
    
    switch ( seleccion ) {
        case 0:
            etiquetaTitulo.stringValue = @"👾 Juegos de sarbalap 👾";
            break;
        case 1:
            etiquetaTitulo.stringValue = @"👾 Juegos de aplabar 👾";
            break;
        case 2:
            etiquetaTitulo.stringValue = @"👾 Juegos de p**ab*a 👾";
            break;
    }
}

-(void)awakeFromNib {
    [imgCorrecto setHidden:YES];
    [imgIncorrecto setHidden:YES];
    [botonRespuesta setEnabled:NO];
}
@end
