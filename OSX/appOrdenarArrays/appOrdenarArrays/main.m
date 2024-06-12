//
//  main.m
//  appOrdenarArrays
//
//  Created by Jorge Cisneros on 03/03/24.
//

#import <Foundation/Foundation.h>
#include "Ordenamiento.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *lista = [[NSMutableArray alloc] init];
        NSNumber *num;
        NSNumber *tamano = [NSNumber numberWithInt:arc4random_uniform(20) + 5];
        char manera, seguir;
        int numero;
        
        while ( seguir != 'n' ) {
            printf("Cómo le gustaría generar la lista? Manualmente o Aleatoriamente?(m/a)\n");
            scanf(" %c", &manera);
            
            if ( manera == 'm' ){
                for (int i = 0; i < [tamano intValue]; i++) {
                    
                    printf("Número %d: ", i + 1);
                    scanf("%d", &numero);
                    [lista addObject:[NSNumber numberWithInt:numero]];
                }
            } else if ( manera == 'a' ) {
                for (int i = 0; i < [tamano intValue]; i++) {
                    NSNumber *numRand = [NSNumber numberWithInt:arc4random_uniform(100) + 1];
                    [lista addObject:numRand];
                }
                
                for (num in lista) {
                    printf("Número: %d \n", [num intValue]);
                }
            }
            
            printf("🥸 Ordenando la lista de números...\n");
            
            printf("Mostrando lista ordenada...\n");
            for (NSNumber *numero in [Ordenamiento metodo:lista]) {
                printf("👾 %d \n", [numero intValue]);
            }
            
            printf("Quiere seguir ordenando números?(s/n)\n");
            scanf(" %c", &seguir);
        }
        
    }
    return 0;
}
