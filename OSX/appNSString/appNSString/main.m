//
//  main.m
//  appNSString
//
//  Created by Jorge on 03/03/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *palabras = [NSMutableArray arrayWithObjects:@"gato",@"azul",@"murciélago",@"juego",@"peluche", nil];
        
        NSString *palabra = palabras[random() %[palabras count]];
        NSString *inputString;
        char continuar;
        
        while ( continuar != 'n' ) {
            printf("🤡🤡 Adivina la palabra secreta 🤡🤡\n");
            printf("🕵️ La palabra empieza con: %c y termina en: %c\n", [palabra characterAtIndex:0], [palabra characterAtIndex:[palabra length]-1]);
            
            // Utilizar la clase NSFileHandle para leer la entrada del usuario desde la consola
            NSFileHandle *inputHandle = [NSFileHandle fileHandleWithStandardInput];
            NSData *inputData = [inputHandle availableData];
                    
            // Convertir los datos de entrada en una cadena utilizando NSString
            inputString = [[NSString alloc] initWithData:inputData encoding:NSUTF8StringEncoding];
                    
            // Eliminar el carácter de nueva línea del final de la cadena (si existe)
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
            
            // Poner en minusculas la palabra para que concuerde sin importar que letras en mayusculas ponga el usuario
            [inputString lowercaseString];
            
            if ( [inputString isEqualToString:palabra] ) {
                printf("Felicidades, adivinaste la palabra %s!!! 🥳🥳\n", [[palabra capitalizedString] UTF8String]);
                [palabras removeObject:palabra];
                
                if ( [palabras count] > 0 ) {
                    palabra = palabras[random() %[palabras count]];
                } else {
                    printf("🥳🥳 Has adivinado todas las palabras!!! 🥳🥳\n");
                    return 0;
                }
            } else {
                printf("Lo siento, palabra incorrecta 😢😢\n");
            }
            
            printf("Listo para continuar? (s/n)\n");
            scanf(" %c", &continuar);
        }
        
        
    }
    return 0;
}
