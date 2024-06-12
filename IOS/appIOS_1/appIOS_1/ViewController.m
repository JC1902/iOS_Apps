//
//  ViewController.m
//  appIOS_1
//
//  Created by Jorge on 22/03/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // MOSTRAR U OCULTAR EL TECLADO
    
    UITapGestureRecognizer *tap = [ [ UITapGestureRecognizer alloc ] initWithTarget:self action:@selector(dissmissKeyboard) ];
    
    [ self.view addGestureRecognizer:tap ];
    
}

// EVENTO PARA OCULTAR EL TECLADO
- ( void ) dissmissKeyboard {
    
    [ _textoUno resignFirstResponder ];
    
}


- (IBAction)mostrarTeclado:(UITextField *)sender {
    
    [ self becomeFirstResponder ];
    
    
}

- (IBAction)botonCantMayusculas:(UIButton *)sender {
    
    NSString *cad = _textoUno.text;
    NSInteger len = _textoUno.text.length;
    int i, cont;
    i = cont = 0;
    
    while ( i < len ) {
        
        unichar letra = [ cad characterAtIndex:i ];
        
        if ( letra >= 'A' && letra <= 'Z' )
            cont++;
        
        i++;
        
    }
    
    _textoDos.text = [ [ NSString alloc ] initWithFormat:@"%d", cont ];
    
}

NSString* convertirAMayusculas( NSString* input ) {
    
    NSMutableString* resultado = [ NSMutableString stringWithCapacity:[ input length ] ];
    NSLocale* locale = [ NSLocale currentLocale ]; // Obtener el local actual para manejar caracteres especiales correctamente
    for ( NSUInteger i = 0; i < [ input length ]; i++) {
        
        unichar caracter = [ input characterAtIndex:i ];
        
        // Convertir el carácter a mayúsculas utilizando el local actual
        NSString* mayuscula = [ [ NSString stringWithCharacters:&caracter length:1 ] uppercaseStringWithLocale:locale ];
        [ resultado appendString:mayuscula ];
        
    }
    
    return resultado;
}

- (IBAction)botonAMayusculas:(UIButton *)sender {
    
    //_textoUno.text = [ _textoUno.text uppercaseString ];
    
    // IMPLEMENTAR UN METODO PARA SIMULA EL FUNCIONAMIENTO DE UPPERCASESTRING
    _textoUno.text = convertirAMayusculas( _textoUno.text );
}

- (IBAction)botonSaludar:(UIButton *)sender {
    
    _labelSaludo.text = _textoUno.text;
    
}
@end
