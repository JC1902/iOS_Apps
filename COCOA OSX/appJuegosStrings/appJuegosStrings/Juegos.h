//
//  Juegos.h
//  appJuegosStrings
//
//  Created by Jorge on 15/03/24.
//

#import <Foundation/Foundation.h>
#include <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Juegos : NSObject
{
    
    __weak IBOutlet NSTextField *etiquetaPalabra;
    __weak IBOutlet NSTextField *etiquetaResultado;
    __weak IBOutlet NSTextField *entradaUsuario;
    __weak IBOutlet NSSegmentedControl *selectorJuegos;
    __weak IBOutlet NSImageView *imgCorrecto;
    __weak IBOutlet NSImageView *imgIncorrecto;
    __weak IBOutlet NSTextField *etiquetaTitulo;
    __weak IBOutlet NSButton *botonRespuesta;
    
    NSMutableString *palabra;
    
}

- (IBAction)selectorJuegos:(NSSegmentedCell *)sender;
- (IBAction)botonPlay:(NSButton *)sender;
- (IBAction)botonRespuesta:(NSButton *)sender;
- (IBAction)botonSalir:(NSButton *)sender;


@end

NS_ASSUME_NONNULL_END
