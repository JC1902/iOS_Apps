//
//  Ordenamiento.m
//  appOrdenamientos
//
//  Created by Jorge on 10/03/24.
//

#import "Ordenamiento.h"

@implementation Ordenamiento

+(NSArray *) burbuja: (NSArray *) vector {
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


+(NSArray *) quickSortAsc:(NSArray *)unsortedArray {
 
    
    int count = (int)[unsortedArray count];
    if (count <= 1) {
        return unsortedArray;
    }
 
    int pivot = [[unsortedArray objectAtIndex: (count/2)] intValue];
    NSMutableArray *smallerThanArray = [NSMutableArray array];
    NSMutableArray *largerThanArray = [NSMutableArray array];
    NSMutableArray *pivotArray = [NSMutableArray array];
    [pivotArray addObject: @(pivot)];
 
    for (int e = 0; e < count; e++) {
        int num = [[unsortedArray objectAtIndex:e] intValue];
 
        if (num > pivot) {
            [smallerThanArray addObject: @(num)];
        } else if (num < pivot) {
            [largerThanArray addObject: @(num)];
            // To address the possibly duplicate that is defined in the pivot, in this case 4.
        } else if (e != (count/2) && pivot == num) {
            [pivotArray addObject: @(num)];
        }
    }
 
    NSMutableArray *returnArray = [NSMutableArray array];
    [returnArray addObjectsFromArray: [self quickSortAsc: smallerThanArray]];
    [returnArray addObjectsFromArray: pivotArray];
    [returnArray addObjectsFromArray: [self quickSortAsc: largerThanArray]];
 
    return returnArray;
}

+ (NSArray *) mergeArray:(NSArray *)leftArray rightArray:(NSArray *)rightArray {
 
    NSMutableArray *returnArray = [NSMutableArray array];
    int i = 0, e = 0;
 
    while (i < [leftArray count] && e < [rightArray count]) {
        int leftValue = [[leftArray objectAtIndex:i] intValue];
        int rightValue = [[rightArray objectAtIndex:e] intValue];
        if (leftValue < rightValue) {
            [returnArray addObject: [leftArray objectAtIndex:i++]];
        } else {
            [returnArray addObject: [rightArray objectAtIndex:e++]];
        }
    }
 
    while (i < [leftArray count]) {
        [returnArray addObject: [leftArray objectAtIndex:i++]];
    }
 
    while (e < [rightArray count]) {
        [returnArray addObject: [rightArray objectAtIndex:e++]];
    }
 
    return returnArray;
}
 
 
+ (NSArray *) mergeSortArray:(NSArray *)unsortedArray {
 
    // Time complexity: Worst case is: O(n * log(n)).
    // Space complexity: O(3 * n) or O(n) due to the 3 NSArrays that are used.
 
 
    int count = (int)[unsortedArray count];
    if (count < 2) {
        return unsortedArray;
    }
    int middle = count / 2;
    NSArray *leftArray = [unsortedArray subarrayWithRange: NSMakeRange(0, middle)];
    NSArray *rightArray = [unsortedArray subarrayWithRange: NSMakeRange(middle, (count - middle))];
 
    NSArray *returnArray = [self mergeArray: [self mergeSortArray: leftArray] rightArray: [self mergeSortArray: rightArray]];
    
    return returnArray;
}

@end
