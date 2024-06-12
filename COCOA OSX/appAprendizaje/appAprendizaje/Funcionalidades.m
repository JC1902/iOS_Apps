//
//  Funcionalidades.m
//  appAprendizaje
//
//  Created by Jorge on 18/03/24.
//

#import "Funcionalidades.h"

@implementation Funcionalidades


NSMutableString * (^desordenarPalabra) ( NSMutableString * ) =
    ^( NSMutableString *palabra ) {
        unsigned long largo = [palabra length];
        NSMutableArray *caracteres = [NSMutableArray arrayWithCapacity:largo];
        NSString *caracter;
        NSMutableString *stringResultante = [NSMutableString string];
        unsigned long contador;
        unsigned long resto, nuevoIndex;
        
        for( int i = 0; i < largo; i++ ) {
            caracter = [NSString stringWithFormat:@"%c", [palabra characterAtIndex:i]];
            [caracteres addObject:caracter];
        }
        
        contador = [caracteres count];
        
        for ( int i = 0; i < contador; i++ ) {
            resto = contador - i;
            nuevoIndex = i + arc4random_uniform(resto);
            [caracteres exchangeObjectAtIndex:i withObjectAtIndex:nuevoIndex];
        }
        
        for ( NSString *caracter in caracteres ) {
            [stringResultante appendString:caracter];
        }
        
        return stringResultante;
    };

- (void)awakeFromNib {
    [_botonReinicio setEnabled:NO];
    [botonRespuesta setEnabled:NO];
    
    [barraScroll setDocumentView:areaPalabras];
    
//    palabras = [NSMutableArray arrayWithObjects: @"perro", @"celular", @"payaso", @"pixel", @"canica", @"medalla", @"peluche", @"instrumento", @"rojo", @"codigo", @"numero", @"bocina", @"tecla", @"aviones", @"arcoiris", @"canasta", @"piano", @"patineta", @"balero", @"manzana", @"murcielago", @"consola", @"videojuego", @"zapatos", @"cajones", @"hidrogeno", nil];
}

-(void) contador {
    [_labelTimer setIntValue:cont];
    cont++;
    
    if ( cont >= 60 ) {
        [botonRespuesta setEnabled:NO];
        [_botonInicio setEnabled:NO];
        [_botonReinicio setEnabled:NO];
        
        [textoEntrada setEnabled:NO];
        
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:@"Se acabó el tiempo"];
        [alert setInformativeText:[NSString stringWithFormat:@"Adivinaste %d palabras",puntos]];
        [alert addButtonWithTitle:@"Reiniciar 🔁"];
        
        if ([alert runModal] == NSAlertFirstButtonReturn ){
            [NSApp terminate:self];
        }
    }
}

- (IBAction)botonInicio:(NSButton *)sender {
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(contador) userInfo:nil repeats:YES];
    
    //palabra = palabras[random() % [palabras count]];
    palabra = palabras[arc4random_uniform((uint32_t)[palabras count])];
    
    labelPalabra.stringValue = desordenarPalabra(palabra);
    
    [_botonInicio setEnabled:NO];
    [_botonReinicio setEnabled:YES];
    [botonRespuesta setEnabled:YES];
}

-(void) agregarPalabra {
    NSString *textoExis =  areaPalabras.stringValue;
    
    NSString *nuevoTexto = textoEntrada.stringValue;
    NSString *textCombinado;
    
    textCombinado = [NSString stringWithFormat:@"%@, %@",textoExis,nuevoTexto];
    
    areaPalabras.stringValue = textCombinado;
    
}

- (IBAction)botonRespuesta:(NSButton *)sender {
    
    textoEntrada.stringValue = [textoEntrada.stringValue lowercaseString];
    
    if ( [textoEntrada.stringValue isEqualToString:palabra] ) {
        puntos++;
        
        [labelPalabra setAlphaValue:1.0];
        labelPalabra.stringValue = @"Acertaste!! 🥳";
        
        [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
            context.duration = 1.0;
            [[labelPalabra animator] setAlphaValue:0.0];
        } completionHandler:^{
            self->palabra = self->palabras[random() % [self->palabras count]];
            
            [self->labelPalabra setStringValue:desordenarPalabra(self->palabra)];
            
            [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
                context.duration = 1.0;
                [[self->labelPalabra animator] setAlphaValue:1.0];
            } completionHandler:nil];
        }];
        
        [self agregarPalabra];
        
        textoEntrada.stringValue = @"";
    } else {
        [labelPalabra setAlphaValue:1.0];
        labelPalabra.stringValue = @"Incorrecto 🙅‍♂️";
        
        [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
            context.duration = 1.0;
            [[labelPalabra animator] setAlphaValue:0.0];
        } completionHandler:^{
            
            [self->labelPalabra setStringValue:desordenarPalabra(self->palabra)];
            
            [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
                context.duration = 1.0;
                [[self->labelPalabra animator] setAlphaValue:1.0];
            } completionHandler:nil];
        }];
    }
    
}

- (IBAction)botonReinicio:(NSButton *)sender {
    
    [timer invalidate]; // DETENER EL TIMER
    
    [_labelTimer setStringValue:@"Reiniciando..."];
    
    cont = 0;
    [_botonInicio setEnabled:YES];
}

- (IBAction)selectorCosas:(NSSegmentedControl *)sender {
    
    seleccion = (int)sender.selectedSegment;
    
    switch (seleccion) {
        case 0:
            palabras = [NSMutableArray arrayWithObjects:@"perro", @"gato", @"abeja", @"anguila", @"aguila", @"cocodrilo", @"lagarto", @"oso", @"venado", @"iguana", @"tiburon", @"murcielago", @"dragon", @"trucha", @"oso polar", nil];
            break;
        case 1:
            palabras = [NSMutableArray arrayWithObjects:@"sandia", @"piña", @"aguacate", @"tamarindo", @"hotdog", @"mollete", @"papas", @"cilantro", @"chilaquiles", @"frijoles", @"chocolate", @"bombones", @"chile", nil];
            break;
        case 2:
            palabras = [NSMutableArray arrayWithObjects:@"guitarra", @"flauta", @"trompeta", @"bateria", @"bajo", @"piano", @"triangulo", @"bongoes", @"silofono", @"chelo", @"violin", @"trombon", @"clarinete", @"armonica", nil];
            break;
        case 3:
            palabras = [NSMutableArray arrayWithObjects:@"guitarra", @"flauta", @"trompeta", @"bateria", @"bajo", @"piano", @"triangulo", @"bongoes", @"silofono", @"chelo", @"violin", @"trombon", @"clarinete", @"armonica",@"perro", @"gato", @"abeja", @"anguila", @"aguila", @"cocodrilo", @"lagarto", @"oso", @"venado", @"iguana", @"tiburon", @"murcielago", @"dragon", @"trucha", @"oso polar", @"sandia", @"piña", @"aguacate", @"tamarindo", @"hotdog", @"mollete", @"papas", @"cilantro", @"chilaquiles", @"frijoles", @"chocolate", @"bombones", @"chile", nil];
            break;
    }
    
}
@end
