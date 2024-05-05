//
//  ViewController.h
//  appPickerRegex
//
//  Created by Jorge on 21/04/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
{
    
}

@property (weak, nonatomic) IBOutlet UILabel *etiquetaResultado;
@property (weak, nonatomic) IBOutlet UITextField *textoRevisar;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerExpresiones;

@property ( strong, nonatomic )NSArray *listaRegex;


@end

