//
//  main.m
//  appArray3Digitos
//
//  Created by jorge cisneros on 25/02/24.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *numeros = [[NSMutableArray alloc] init];
        NSNumber *numero;
        NSNumber *tamano = [NSNumber numberWithInt:arc4random_uniform(15) + 5];
                
        // INSERTAR EN EL ARREGLO NUMEROS ALEATORIOS DE 3 DIGITOS
        for (int i = 0; i < [tamano intValue]; i++) {
            NSNumber *randNum = [NSNumber numberWithInt:arc4random_uniform(900) + 100];
            [numeros addObject:randNum];
        }
                
        // MOSTRAR EL ARREGLO USANDO EL CICLO FOR IN
        for (numero in numeros) {
            printf("🤓Número %lu: %d \n", [numeros indexOfObject:numero] + 1, [numero intValue]);
        }
    }
    return 0;
}
