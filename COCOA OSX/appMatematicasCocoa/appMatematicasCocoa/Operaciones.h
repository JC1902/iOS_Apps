//
//  Operaciones.h
//  appCalculadora
//
//  Created by jorge c on 18/02/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Operaciones : NSObject
// SUMA
-(NSNumber *)suma:(NSNumber *)num1 mas:(NSNumber *)num2;
// RESTA
-(NSNumber *)resta:(NSNumber *)num1 menos:(NSNumber *)num2;
// MULTIPLICACION
-(NSNumber *)multiplica:(NSNumber *)num1 por:(NSNumber *)num2;
// DIVISION
-(NSNumber *)divide:(NSNumber *)num1 entre:(NSNumber *)num2;
// RESIDUO
-(int)obtenResiduo:(int)deNum1 entre:(int)num2;
// FACTORIAL
-(double)factorial:(double)n;
// ES_PRIMO
-(BOOL)esPrimo:(int)n;
// ES BISIESTO
-(BOOL)esBisiesto:(int)ano;
// SENO
-(NSNumber *)sen:(NSNumber *)n;
// COSENO
-(NSNumber *)cos:(NSNumber *)n;
// TANGENTE
-(NSNumber *)tan:(NSNumber *)n;

@end

NS_ASSUME_NONNULL_END
