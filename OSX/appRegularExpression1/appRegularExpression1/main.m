//
//  main.m
//  appRegularExpression1
//
//  Created by Jorge on 09/04/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *string1 = @"NIÑOS, niñas y Jóvenes atentos a la siguiente información: el 9 de abril del 2024 NO habrá clases 🥳";
        
        NSString *correoEjemplo1 = @"user_09@example.com";
        NSString *correoEjemplo2 = @"username@example.co.uk";
        NSString *correoEjemplo3 = @"USER123@EXAMPLE.NET";
        NSString *correoEval = @"<micorreo.21/11/2002>@blackmesa.net";
        
        
        NSString *patronLetras = @"[A-Za-z]|[ñÑ]";
        NSString *patronVocales = @"[AEIOUaeiouÁÉÍÓÚáéíóú]";
        //NSString *patronDigitos = @"[0-9]";
        NSString *patronDigitos = @"\\d";
        NSString *patronEspacios = @"\\b";
        NSString *patronCorreo1 = @"^[\\w-]+(\\.?[\\w-]+)@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)(\\.[A-Za-z]{2,})?$”";
        NSString *patronCorreo2 = @"^[\\w-]+(\\.[\\_-w]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
        NSString *patronCorreo3 = @"[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}";
        NSString *patronCaracteresDiversos = @"[,:;\\.\\-\\?!\"'\\[\\]\\(\\)\\{\\}]";
        
        NSString *miPatron = @"^<([a-zA-Z]+)\\.([0-9]+\\/[0-9]+\\/[0-9]+)>@\\b(blackmesa)\\b(\\.[a-zA-Z]{2,})$";
        
        NSError *error = NULL;
        NSRegularExpression *expRegularLetras = [ NSRegularExpression regularExpressionWithPattern:patronLetras options:NSRegularExpressionCaseInsensitive error:&error ];
        
        NSArray *matchesLetras = [ expRegularLetras matchesInString:string1 options:0 range:NSMakeRange( 0, string1.length ) ];
        
        NSRegularExpression *expRegularVocales = [ NSRegularExpression regularExpressionWithPattern:patronVocales options:NSRegularExpressionCaseInsensitive error:&error ];
        
        NSArray *matchesVocales = [ expRegularVocales matchesInString:string1 options:0 range:NSMakeRange( 0, string1.length ) ];
        
        NSRegularExpression *expRegularDigitos = [ NSRegularExpression regularExpressionWithPattern:patronDigitos options:NSRegularExpressionCaseInsensitive error:&error ];
        
        NSArray *matchesDigitos = [ expRegularDigitos matchesInString:string1 options:0 range:NSMakeRange( 0, string1.length ) ];
        
        NSRegularExpression *expRegularEspacios = [ NSRegularExpression regularExpressionWithPattern:patronEspacios options:NSRegularExpressionCaseInsensitive error:&error ];
        
        NSArray *matchesEspacio = [ expRegularEspacios matchesInString:string1 options:0 range:NSMakeRange( 0, string1.length ) ];
        
        NSRegularExpression *expRegularVarios = [ NSRegularExpression regularExpressionWithPattern:patronCaracteresDiversos options:NSRegularExpressionCaseInsensitive error:&error ];
        
        NSArray *matchesVarios = [ expRegularVarios matchesInString:string1 options:0 range:NSMakeRange( 0, string1.length ) ];
        
        NSRegularExpression *expRegularCorreo1 = [ NSRegularExpression regularExpressionWithPattern:patronCorreo1 options:0 error:&error ];
        
        NSArray *matchesCorreo1 = [ expRegularCorreo1 matchesInString:correoEjemplo1 options:0 range:NSMakeRange( 0, correoEjemplo1.length ) ];
        
        NSRegularExpression *expRegularCorreo2 = [ NSRegularExpression regularExpressionWithPattern:patronCorreo2 options:0 error:&error ];
        
        NSArray *matchesCorreo2 = [ expRegularCorreo2 matchesInString:correoEjemplo2 options:0 range:NSMakeRange( 0, correoEjemplo2.length ) ];
        
        NSRegularExpression *expRegularCorreo3 = [ NSRegularExpression regularExpressionWithPattern:patronCorreo3 options:0 error:&error ];
        
        NSArray *matchesCorreo3 = [ expRegularCorreo3 matchesInString:correoEjemplo3 options:0 range:NSMakeRange( 0, correoEjemplo3.length ) ];
        
        NSRegularExpression *expRegularMiCorreo = [ NSRegularExpression regularExpressionWithPattern:miPatron options:0 error:&error ];
        
        NSArray *matchesMiCorreo = [ expRegularMiCorreo matchesInString:correoEval options:0 range:NSMakeRange( 0, correoEval.length ) ];
        
        NSLog(@"Cadena a Analizar: %@", string1);
        
        NSLog(@"Cantidad de Caracteres: %d", (int)string1.length );
        
        int cantLetras = (int)matchesLetras.count;
        int cantVocales = (int)matchesVocales.count;
        int cantEspacios = (int)matchesEspacio.count;
        int cantVarios = (int)matchesVarios.count;
        
        NSLog(@"Cantidad de Vocales: %d", cantVocales);
        NSLog(@"Cantidad de Consonantes: %d", cantLetras - cantVocales);
        
        int cantDigitos = (int)matchesDigitos.count;
        NSLog(@"Cantidad de Digitos: %d", cantDigitos);
        
        NSLog(@"Cantidad de espacios: %d", cantEspacios);
        
        // Mostrar resultados
        NSLog(@"Coincidencias para patrón 1:");
        if ([matchesCorreo1 count] > 0) {
            NSLog(@"La cadena \"%@\" es una dirección de correo válida según el patrón 1.", correoEjemplo1);
        } else {
            NSLog(@"La cadena \"%@\" NO es una dirección de correo válida según el patrón 1.", correoEjemplo1);
        }

        NSLog(@"Coincidencias para patrón 2:");
        if ([matchesCorreo2 count] > 0) {
            NSLog(@" %ld ", matchesCorreo2.count);
            NSLog(@"La cadena \"%@\" es una dirección de correo válida según el patrón 2.", correoEjemplo2);
        } else {
            NSLog(@"La cadena \"%@\" NO es una dirección de correo válida según el patrón 2.", correoEjemplo2);
        }

        NSLog(@"Coincidencias para patrón 3:");
        if ([matchesCorreo3 count] > 0) {
            NSLog(@"La cadena \"%@\" es una dirección de correo válida según el patrón 3.", correoEjemplo3);
        } else {
            NSLog(@"La cadena \"%@\" NO es una dirección de correo válida según el patrón 3.", correoEjemplo3);
        }
        
        NSLog(@"Coincidencias para MI PATRON:");
        if ([matchesMiCorreo count] > 0) {
            NSLog(@"La cadena \"%@\" es una dirección de correo válida según MI PATRON.", correoEval);
        } else {
            NSLog(@"La cadena \"%@\" NO es una dirección de correo válida según MI PATRON.", correoEval);
        }
        
        NSLog(@"Cantidad de caracteres diversos: %d", cantVarios);
        
        // ARCHIVOS EN OBJECTIVE-C
        NSMutableString *cadenaMutable = [ [ NSMutableString alloc ] initWithString:string1 ];
        
        NSLog(@"CADENA 1: %@", cadenaMutable );
        
        NSString *nomArch = @"archivoERegulares.txt";
        
        NSString *path = [ NSHomeDirectory() stringByAppendingPathComponent:nomArch ];
        
        NSLog(@"Path: %@", path);
        
        [cadenaMutable writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:NULL ];
        
        NSLog(@"ARCHIVO GUARDADO");
        
        NSError *errorArchivo;
        
        // LEER EL ARCHIVO
        NSString *string2 = [[ NSString alloc ] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&errorArchivo ];
        
        if ( !string2 )
            NSLog(@"Error, archivo no encontrado: %@", [errorArchivo localizedDescription]);
        else
            NSLog(@"Contenido del archivo: %@", string2);
        
    }
    return 0;
}
