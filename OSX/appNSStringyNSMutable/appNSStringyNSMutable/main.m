//
//  main.m
//  appNSStringyNSMutable
//
//  Created by jorge c on 01/03/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // APP EVALUACION SORT
        // APP CADENAS
        // APP CON BLOQUES, OPERACIONES ARITMETICAS O MANEJO DE CADENAS
        NSString *str1 = @"tec laguna";
        NSString *str2 = @"World";
        NSString *str3;
        unsigned long  len ;
        
        /* uppercase string */
        str3 = [str2 uppercaseString];
        NSLog(@"Uppercase String :  %@\n", str3 );

        /* concatenates str1 and str2 */
        str3 = [str1 stringByAppendingFormat:@"World"];
        NSLog(@"Concatenated string:   %@\n", str3 );

        /* total length of str3 after concatenation */
        len = [str3 length];
        NSLog(@"Length of Str3 :  %lu\n", len );

        /* InitWithFormat */
        //str3 = [[NSString alloc] initWithFormat:@"%@ %@",str1,str2];
        str3 = str1;
        NSLog(@"Using initWithFormat:   %@\n", str3 );

        str3 = [str1 uppercaseString];
        NSLog(@"Using initWithFormat:   %@\n", str1 );
        
        str3 = [str1 capitalizedString];
        NSLog(@"No sé lo que haga: %@ \n", str3);
        
        str3 = [str1 lowercaseString];
        NSLog(@"str1 = %@", str1);
        NSLog(@"str3 = %@", str3);
        
        if ([str3 hasPrefix:@"tec"]) {
            NSLog(@"LA CADENA INICIA CON TEC");
        } else {
            NSLog(@"LA CADENA NO INICIA CON TEC");
        }
        
        if([str3 hasSuffix:@"a"]) {
            NSLog(@"LA CADENA TERMINA CON a");
        } else {
            NSLog(@"LA CADENA NO TERMINA CON a");
        }
        
        // EJEMPLOS CON NSMutableString
        NSMutableString *cadena1;
        NSMutableString *cadena2;
        
        cadena1 = [NSMutableString stringWithString:@"Tec. Laguna"];
        cadena2 = cadena1;
        
        NSLog(@"Dirección cadena1: %p, Dirección cadena2: %p", cadena1, cadena2);
        
        NSLog(@"Cadena1: %@", cadena1);
        NSLog(@"Cadena2: %@", cadena2);
        
        [cadena2 appendString:@". Torreón, Coah"];
        
        NSLog(@"Cadena1: %@", cadena1);
        
        [cadena1 appendString:@". México"];
        
        NSLog(@"Cadena2: %@", cadena2);
        NSLog(@"Cadena1: %@", cadena1);
        
        NSRange match;
        
        [cadena2 appendString:[cadena2 lowercaseString]];
        
        match = [cadena2 rangeOfString:@"coah"];
        if( match.location == NSNotFound )
            NSLog(@"Subcadena no encontrada");
        else
            NSLog(@"La cadena se encontró en la posición: %lu", match.location);
        
        // REMPLAZAR O MODIFICAR
        NSMutableString *cadAux = [NSMutableString stringWithString:@"INSTITUTO TECNOLÓGICO DE LA LAGUNA"];
        
        [cadAux replaceCharactersInRange:NSMakeRange(10, 11) withString:@"tecnologico"];
        
        NSLog(@"Cadena Auxilirar: %@", cadAux);
        
        [cadAux replaceCharactersInRange:[cadAux rangeOfString:@"tecnologico"] withString:@"TECNOLÓGICO"];
        NSLog(@"Cadena Auxilirar: %@", cadAux);
        
        [cadAux deleteCharactersInRange:[cadAux rangeOfString:@"DE LA"]];
        NSLog(@"Cadena Auxilirar borrando \"DE LA\": %@", cadAux);
        
        // EJEMPLOS SUBCADENAS
        NSString *cadAux2;
        cadAux2 = [ cadAux substringWithRange:NSMakeRange(10, 11)];
        NSLog(@"SUBCADENA 2: %@", cadAux2);
        
        cadAux2 = [ cadAux substringToIndex:21 ];
        NSLog(@"SUBCADENA 2: %@", cadAux2);
                // DESDE
        cadAux2 = [ cadAux substringFromIndex:21 ];
        NSLog(@"SUBCADENA 2: %@", cadAux2);
        
        NSMutableString *cadAux3 = [ NSMutableString stringWithString:@"INSTITUTO" ];
        NSMutableString *cadAux4 = [ NSMutableString stringWithString:@"TECNOLOGICO DE LA LAGUNA, Torreon, Coah. MX" ];
        
        // NSString *cadAux5 = [[NSString alloc] initWithFormat: @"%@ %@", cadAux3, cadAux4];
        
        
        NSMutableString *cadAux5 = [[NSMutableString alloc] initWithFormat:@"%@ %@", cadAux3, cadAux4];
        
        NSLog(@"CADENAS CONCATENADAS : %@\n\a\a", cadAux5);
        
        // EVALUACION
        // INVERTIR LA CADENA cadAux5 Y ASIGNARLA A OTRA CADENA
        NSMutableString *cadAux6 = [[NSMutableString alloc] init];
        unsigned long largo = [cadAux5 length];
        char caracter;
        
        for( int i = largo-1; i >= 0; i-- ) {
            caracter = [cadAux5 characterAtIndex:i];
            [cadAux6 appendFormat:@"%c", caracter];
        }
        
        NSLog(@"CADENAAUX6: %@", cadAux6);
    }
    return 0;
}
