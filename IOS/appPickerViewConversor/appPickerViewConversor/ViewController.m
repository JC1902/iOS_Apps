//
//  ViewController.m
//  appPickerViewConversor
//
//  Created by Jorge on 11/04/24.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *paises;
    NSArray *banderas;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    paises = @[ @"Australia", @"China", @"Francia", @"Inglaterra", @"Japón", @"México", @"UE" ];
    
    banderas = @[ @"🇦🇺", @"🇨🇳", @"🇫🇷", @"🏴󠁧󠁢󠁥󠁮󠁧󠁿", @"🇯🇵", @"🇲🇽", @"🇪🇺" ];
    
    _tipoDeCambio = [ [ NSArray alloc ] initWithObjects:[ NSNumber numberWithFloat:1.54], [ NSNumber numberWithFloat:7.27 ], [ NSNumber numberWithFloat:6.5595 ], [ NSNumber numberWithFloat:0.80 ], [ NSNumber numberWithFloat:153.13 ], [ NSNumber numberWithFloat:16.67 ], [ NSNumber numberWithFloat:0.94 ], nil ];
    
    self.pickerPaises.delegate = self;
    self.pickerPaises.dataSource = self;
    
    _etiquetaResultado.text = @"Equivalencia de divisas";
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [paises count];
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return paises[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    float valorMoneda = [ [ _tipoDeCambio objectAtIndex:row ] floatValue ];
    
    float dolares = [ _cantidadDolares.text floatValue ];
    
    float resultado = valorMoneda * dolares;
    NSString *resultadoString = [ [ NSString alloc ] initWithFormat:@"%.2f USD = %.2f %@",dolares,resultado, [banderas objectAtIndex:row ] ];
    
    NSLog(@"Resultado: %@", resultadoString);
    
    _etiquetaResultado.text = resultadoString;
    
}


@end
