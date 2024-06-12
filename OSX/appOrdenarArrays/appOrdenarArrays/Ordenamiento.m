//
//  Ordenamiento.m
//  appOrdenarArrays
//
//  Created by Jorge on 03/03/24.
//

#import "Ordenamiento.h"

@implementation Ordenamiento

+(NSArray *) metodo: (NSArray *) vector {
    int comp, interc;
    comp = interc = 0;
    NSMutableArray* vecAux = [[NSMutableArray alloc] initWithArray:vector]; // Dar a un vector auxilar el vector recibido
    for(int i = 0; i < [vecAux count] - 1; i++) // Ciclo que recorre el vector
    {
        for(int j =(int)[vecAux count]-1; j > i ; j--) // Ciclo que recorre a la inversa el arreglo hasta ser menor que i
        {
            comp++; // Sumar a la variable comp 1
            if([[vecAux objectAtIndex:(j-1)] intValue] > [[vecAux objectAtIndex:j] intValue]) // revisar si el objeto anterior es mayor al que le sigue
            {
                int temp = [[vecAux objectAtIndex:(j-1)]intValue]; // Poner el anteriror en un temporal
                [vecAux replaceObjectAtIndex:j-1 withObject:[vecAux objectAtIndex:j]]; // Colocarlo en el lugar del anterior
                [vecAux replaceObjectAtIndex:j withObject:[NSNumber numberWithInt:temp]]; // Colocarlo en el lugar del siguiente
                interc++; // Variable interact se suma 1
            }
        }
    }
    NSLog(@"No. de Comparaciones = %d",comp); // Mostrar el valor de la variable comp
    NSLog(@"No. de Intercambios  = %d",interc); // Mostrar e; valor de la variable interc
    return  [vecAux mutableCopy]; // recresar el vector ordenado
}

@end
