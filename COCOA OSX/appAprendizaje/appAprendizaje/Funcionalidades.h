//
//  Funcionalidades.h
//  appAprendizaje
//
//  Created by Jorge on 18/03/24.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface Funcionalidades : NSObject
{
    
    NSTimer *timer;
    int cont, seleccion;
    NSMutableString *palabra;
    NSMutableArray *palabras;
    int puntos;
    
    __weak IBOutlet NSTextField *labelPalabra;
    __weak IBOutlet NSButton *botonRespuesta;
    __weak IBOutlet NSSegmentedControl *selectorCosas;
    __weak IBOutlet NSScrollView *barraScroll;
    __weak IBOutlet NSTextField *textoEntrada;
    __weak IBOutlet NSTextField *areaPalabras;
    
}

@property (weak) IBOutlet NSButton *botonInicio;
- (IBAction)botonInicio:(NSButton *)sender;

@property (weak) IBOutlet NSButton *botonReinicio;
- (IBAction)botonReinicio:(NSButton *)sender;

- (IBAction)botonRespuesta:(NSButton *)sender;

@property (weak) IBOutlet NSTextField *labelTimer;

- (IBAction)selectorCosas:(NSSegmentedControl *)sender;



@end

NS_ASSUME_NONNULL_END
