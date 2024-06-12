//
//  ViewController.m
//  appPickerView2Cols
//
//  Created by Jorge on 17/04/24.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *productos;
    NSArray *colores;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    productos = @[ @"Pantalla LCD", @"iPad", @"Bicicleta", @"Motocicleta", @"Carro", @"Camioneta" ];
    
    colores = @[ @"Rojo🔴", @"Verde🟢", @"Azul🔵", @"Gris🔘", @"Naranja🟠", @"Aleatorio" ];
    
    _pickerView1.dataSource = self;
    _pickerView1.delegate = self;
    
    _etiqueta1.text = [NSString stringWithFormat:@"%@, %@", [productos objectAtIndex:0], [ colores objectAtIndex:0]];
    
    NSLog(@"%@", _etiqueta1.text );
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 2;
    

}

//--------------------------------------------------------------
- ( NSInteger ) pickerView : ( UIPickerView* ) pickerView numberOfRowsInComponent : ( NSInteger ) component
{
    if ( component == 0 )
        return productos.count;
    else
        return colores.count;
}
//--------------------------------------------------------------
- ( NSString* ) pickerView : ( UIPickerView* ) pickerView titleForRow : ( NSInteger ) row forComponent : ( NSInteger ) component
{
    if( component == 0 )
        return [ productos objectAtIndex : row ];
    else
        return colores [ row ];
    return nil;
}
//--------------------------------------------------------------
- ( void ) pickerView : ( UIPickerView* ) pickerView didSelectRow : ( NSInteger ) row inComponent : ( NSInteger ) component
{
    _etiqueta1.text = [ NSString stringWithFormat : @"%@, %@", [ productos objectAtIndex : [ _pickerView1 selectedRowInComponent : 0 ]], [ colores objectAtIndex : [ _pickerView1 selectedRowInComponent : 1 ] ] ];
    
    int color = ( int ) [ colores indexOfObject : [ colores objectAtIndex : [ _pickerView1 selectedRowInComponent : 1 ] ] ];
    
    int producto = ( int ) [ productos indexOfObject : [ productos objectAtIndex : [ _pickerView1 selectedRowInComponent : 0 ] ] ];
    
    switch( color )
    {
        case 0 :_imageView1.backgroundColor = [ UIColor redColor ];
            break;
        case 1: _imageView1.backgroundColor = [ UIColor greenColor ];
            break;
        case 2: _imageView1.backgroundColor = [ UIColor blueColor ];
            break;
        case 3: _imageView1.backgroundColor = [ UIColor grayColor ];
            break;
        case 4: _imageView1.backgroundColor = [ UIColor orangeColor ];
            break;
            
        case 5: srand( ( unsigned int ) time ( NULL ) );
            UIColor* color = [ UIColor colorWithRed : rand()% 255/255.0 green : rand()%255/2555.0 blue : rand()%255/255.0 alpha : 1 ];
            
            _imageView1.backgroundColor = color;
            
            break;
    }
    
    switch( producto )
    {
        case 0 : _imageView1.image = [ UIImage imageNamed : @"PantallaLCD" ];
            break;
        case 1: _imageView1.image = [ UIImage imageNamed:@"ipad"];
            break;
        case 2: _imageView1.image = [UIImage imageNamed:@"BICI_2"];
            break;
        case 3: _imageView1.image = [ UIImage imageNamed:@"moto1"];
            break;
        case 4: _imageView1.image = [ UIImage imageNamed:@"ferrari1"];
            break;
        case 5 : _imageView1.image = [UIImage imageNamed:@"camioneta1"];
            break;
    }
}


@end
