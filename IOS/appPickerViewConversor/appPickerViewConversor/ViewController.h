//
//  ViewController.h
//  appPickerViewConversor
//
//  Created by Jorge on 11/04/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    
}
@property (weak, nonatomic) IBOutlet UITextField *cantidadDolares;
@property (weak, nonatomic) IBOutlet UILabel *etiquetaResultado;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerPaises;

@property ( strong, nonatomic )NSArray *tipoDeCambio;

@end

