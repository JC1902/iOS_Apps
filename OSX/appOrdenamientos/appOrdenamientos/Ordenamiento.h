//
//  Ordenamiento.h
//  appOrdenamientos
//
//  Created by Jorge on 10/03/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Ordenamiento : NSObject

+(NSArray *) burbuja: (NSArray *) vector;

+(NSArray *) quickSortAsc:(NSArray *)unsortedArray;

+ (NSArray *) mergeSortArray:(NSArray *)unsortedArray;

+ (NSArray *) mergeArray:(NSArray *)leftArray rightArray:(NSArray *)rightArray;

@end

NS_ASSUME_NONNULL_END
