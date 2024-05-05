//
//  Cadena.h
//  appStringsCocoa
//
//  Created by Jorge on 15/03/24.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cadena : NSObject

{
    
    __weak IBOutlet NSTextField *textoEntrada;
    __weak IBOutlet NSTextField *etiquetaSaludar;
    __weak IBOutlet NSTextField *etiquetaCaracteres;
    __weak IBOutlet NSTextField *etiquetaMayusculas;
    __weak IBOutlet NSTextField *etiquetaAMayusculas;
    
}

-(IBAction)botonSaludar:(id)sender;
-(IBAction)botonContarCaracteres:(id)sender;
-(IBAction)botonCantMayusculas:(NSButton *)sender;
- (IBAction)botonConvertirAMayusculas:(id)sender;

@end

NS_ASSUME_NONNULL_END
