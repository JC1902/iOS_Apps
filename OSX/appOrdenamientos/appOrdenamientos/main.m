//
//  main.m
//  appOrdenamientos
//
//  Created by Jorge Cisneros on 10/03/24.
//

#import <Foundation/Foundation.h>
#include "Ordenamiento.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // EJEMPLOS DE CLASE----------------------------------------------
        
            // BURBUJA----------------------------------------------------
        
        NSArray *vector = @[@14,@98,@1,@23,@75];
        NSLog(@"Datos Desordenados");
        
        for ( int i = 0; i < [vector count]; i++) {
            NSLog(@"Numero %@", vector[i]);
        }
        
        NSArray *vectorOrd = [Ordenamiento burbuja:vector];
        
        NSLog(@"Datos Ordenados");
        
        for ( int i = 0; i < [vectorOrd count]; i++) {
            NSLog(@"Numero %@", vectorOrd[i]);
        }
        
        NSMutableArray *vecttor500 = [[NSMutableArray alloc] init];
        
        int ndatos = 500;
        
        for ( int i = 0; i < ndatos; i++) {
            NSNumber *numero = [[NSNumber alloc] initWithInt:arc4random_uniform(900) + 100];
            
            vecttor500[i] = numero;
        }
        
        int r = 0;
        for ( NSNumber *num in vecttor500 ) {
            NSLog(@"Vector[%i] = %@",r++,num);
        }
        
        NSArray *vectorOrdenado1 = [Ordenamiento burbuja:vecttor500];
        
        r = 0;
        printf("DATOS ORDENADOS POR 🛁\n");
        for ( NSNumber *num in vectorOrdenado1 ) {
            NSLog(@"Vector[%i] = %@",r++,num);
        }
        
        
        
            // BURBUJA----------------------------------------------------
        
            // QUICKSORT--------------------------------------------------
        
        printf("DATOS COPIADOS\n");
        NSMutableArray *vectorOrdenadoQ = [vectorOrdenado1 mutableCopy];
        r = 0;
        for ( NSNumber *num in vectorOrdenadoQ ) {
            NSLog(@"Vector[%i] = %@",r++,num);
        }
        
        NSArray *vectorOrdenado2 = [Ordenamiento quickSortAsc:vectorOrdenadoQ];
        
        NSLog(@"DATOS ORDENADOS POR QUICK");
        NSLog(@"%@",vectorOrdenado2);
        
            // QUICKSORT--------------------------------------------------
        
        // MERGESORT-------------------------------------------------------
        
        NSMutableArray *vectorMerge = [vector mutableCopy];
        r = 0;
        for (NSNumber *n in vectorMerge) {
            NSLog(@"VectorMerge[%i] = %@", r++, n);
        }
        
        NSArray *vectorMerge2 = [Ordenamiento mergeSortArray:vectorMerge];
        
        NSLog(@"DATOS ORDENADOS CON MERGE");
        NSLog(@"%@", vectorMerge2);
        
        // MERGESORT-------------------------------------------------------
        
        // EJEMPLOS DE CLASE----------------------------------------------
        
//        // Dar memoria al arreglo
//        NSMutableArray *arreglo = [[NSMutableArray alloc] init];
//
//        // Añadir los elementos al arreglo
//        for ( int i = 0; i <= 500; i++ ) {
//            NSNumber *num = [NSNumber numberWithInt:random()%900 + 10];
//            [arreglo addObject:num];
//        }
//
//        NSArray *arregloOrd = [Ordenamiento quickSort:arreglo];
//
//        // Mostar el arreglo ya ordenado
//        for ( NSNumber *num in arregloOrd ) {
//            printf("Número %lu: %d \n", [arregloOrd indexOfObject:num], [num intValue]);
//        }
        
    }
    return 0;
}
