//
//  ViewController.m
//  appPickerRegex
//
//  Created by Jorge on 21/04/24.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *expresiones;
    NSArray *equivalencia;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    equivalencia = @[ @"Número base 10", @"Hexadecimal", @"Binario", @"Número base 8", @"Número telefónico" ];
    
    _listaRegex = [ [ NSArray alloc ] initWithObjects:[ NSRegularExpression regularExpressionWithPattern:@"^[0-9]+$" options:0 error:NULL ], [ NSRegularExpression regularExpressionWithPattern:@"^[0-9A-Fa-f]+$" options:0 error:NULL ], [ NSRegularExpression regularExpressionWithPattern:@"^[0-1]+$" options:0 error:NULL  ], [ NSRegularExpression regularExpressionWithPattern:@"^[0-7]+$" options:0 error:NULL ], [ NSRegularExpression regularExpressionWithPattern:@"^\\(\\d{3}\\)\\-\\d{3}\\-\\d{4}$" options:0 error:NULL ], nil ];

    
    self.pickerExpresiones.delegate = self;
    self.pickerExpresiones.dataSource = self;
    
    _etiquetaResultado.text = @" ... ";
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [equivalencia count];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return equivalencia[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSRegularExpression *expresionEvaluar = [ _listaRegex objectAtIndex:row ];
    
    NSString *texto = _textoRevisar.text;
    
    int numberOfMatches = (int)[expresionEvaluar numberOfMatchesInString:texto options:0 range:NSMakeRange(0, [texto length])];
    
    if (numberOfMatches > 0) {
        
        _etiquetaResultado.text = @"Número válido";
        
    } else {
        
        _etiquetaResultado.text = @"Número no válido";
        
    }
    
}

@end
