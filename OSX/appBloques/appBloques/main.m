//
//  main.m
//  appBloques
//
//  Created by Jorge Cisneros on 06/03/24.
//

#import <Foundation/Foundation.h>

//-----------------------------------------------------------------------------------------

NSString * (^procesarEntrada)
    (void) = ^{
        // Utilizar la clase NSFileHandle para leer la entrada del usuario desde la consola
        NSFileHandle *inputHandle = [NSFileHandle fileHandleWithStandardInput];
        
        NSData *inputData = [inputHandle availableData];
        
        // Convertir los datos de entrada en una cadena utilizando NSString
        NSString *cadenaUsuario = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
        
        // Eliminar el carácter de nueva línea del final de la cadena (si existe)
        cadenaUsuario = [cadenaUsuario stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        
        // Poner en minusculas la palabra para que concuerde sin importar que letras en mayusculas ponga el usuario
        cadenaUsuario = [cadenaUsuario lowercaseString];
        
        return cadenaUsuario;
    };

//-----------------------------------------------------------------------------------------

NSMutableString * (^quitarLetras)( NSMutableString * ) =
    ^( NSMutableString *palabra ) {
        NSMutableString *palabraMutable = [ palabra mutableCopy ];
        int letrasAQuitar = 3;
        unsigned long posLetra;
        
        if ( [palabra length] <= 4 )
            letrasAQuitar = 2;
        else if ( [palabra length] > 4 && [ palabra length ] <= 15 )
            letrasAQuitar = 4;
        
        for ( int i = 0; i < letrasAQuitar; i++ ) {
            posLetra = arc4random_uniform( [ palabraMutable length ] );
            
            [palabraMutable replaceCharactersInRange:NSMakeRange(posLetra, 1) withString:@"*"];
        }
        
        return palabraMutable;
    };

//-----------------------------------------------------------------------------------------

NSMutableString * (^invertirPalabra)( NSMutableString * ) =
   ^( NSMutableString *palabra ) {
       NSMutableString *cadAux = [[NSMutableString alloc] init];
       unsigned long largo = [palabra length];
       char caracter;
       
       for( int i = largo-1; i >= 0; i-- ) {
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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *palabras = [NSMutableArray arrayWithObjects: @"perro", @"celular", @"payaso", @"pixel", @"canica", @"medalla", @"peluche", @"instrumento", @"rojo", nil];
        NSMutableString *palabra = palabras[ arc4random_uniform( (uint32_t)[ palabras count ] ) ];
        NSString *cadenaUsuario;
        NSString *copiaPalabra;
        
        printf("🤡       Juego de palabras       👾\n\n");
        int minijuego = arc4random_uniform(3);
        
        switch ( minijuego ) {
            case 0:
                printf("🤫 sdlaowDroeesn mlepasbra 🤫\n");
                NSLog(@"🤔 Qué palabra es esta? 🤔 %@", desordenarPalabra(palabra) );
                
                while ( ![cadenaUsuario isEqualToString:palabra] ) {
                    
                    cadenaUsuario = procesarEntrada();
                    
                    if ( [ cadenaUsuario isEqualToString:palabra ] ) {
                        printf("🥳 Felicidades, adivinaste la palabra!! 🥳\n");
                    } else {
                        printf("😔 Lo lamento, vuelva a intentarlo 😔\n");
                    }
                }
                
                break;
            case 1:
                printf("🥴 abralap al somatrivnI 🥴\n");
                NSLog(@"🤔 Qué palabra es esta? 🤔 %@", invertirPalabra(palabra) );
                
                while ( ![cadenaUsuario isEqualToString:palabra] ) {
                    
                    cadenaUsuario = procesarEntrada();
                    
                    if ( [ cadenaUsuario isEqualToString:palabra ] ) {
                        printf("🥳 Felicidades, adivinaste la palabra!! 🥳\n");
                    } else {
                        printf("😔 Lo lamento, vuelva a intentarlo 😔\n");
                    }
                }
                break;
                
            case 2:
                printf("😵 V*m*s a qu*t*r alg*n*s l*tras 😵\n");
                copiaPalabra = palabra;
                NSLog(@"🤔 Qué palabra es esta? 🤔 %@", quitarLetras(palabra) );
                
                while ( ![cadenaUsuario isEqualToString:copiaPalabra] ) {
                    
                    cadenaUsuario = procesarEntrada();
                    
                    if ( [ cadenaUsuario isEqualToString:copiaPalabra ] ) {
                        
                        printf("🥳 Felicidades, adivinaste la palabra!! 🥳\n");
                        
                    } else {
                        
                        printf("😔 Lo lamento, vuelva a intentarlo 😔\n");
                        
                    }
                }
                
                break;
            default:
                break;
        }
    }
    return 0;
}
