//
//  ViewController.h
//  appIOS_1
//
//  Created by Jorge on 22/03/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textoUno;
@property (weak, nonatomic) IBOutlet UILabel *labelSaludo;
@property (weak, nonatomic) IBOutlet UITextField *textoDos;

- (IBAction)botonSaludar:(UIButton *)sender;
- (IBAction)botonAMayusculas:(UIButton *)sender;
- (IBAction)botonCantMayusculas:(UIButton *)sender;

- (IBAction)mostrarTeclado:(UITextField *)sender;


@end

