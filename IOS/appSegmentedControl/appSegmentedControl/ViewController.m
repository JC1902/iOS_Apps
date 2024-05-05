//
//  ViewController.m
//  appSegmentedControl
//
//  Created by Jorge on 24/04/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imagenesVehiculos.image = [UIImage imageNamed:@"carro1"];
}


- (IBAction)segmentChangedValue:(UISegmentedControl *)sender {
    
    switch (self.segmentAspecto.selectedSegmentIndex) {
        case 0:
            self.imagenesVehiculos.contentMode = UIViewContentModeScaleToFill;
            break;
        case 1:
            self.imagenesVehiculos.contentMode = UIViewContentModeScaleAspectFill;
            break;
        case 2:
            self.imagenesVehiculos.contentMode = UIViewContentModeScaleAspectFit;
            break;
            
        default:
            break;
    }
    
}

- (IBAction)segmentValueChanged:(UISegmentedControl *)sender {
    
    switch (self.segmentControlVehiculos.selectedSegmentIndex) {
        case 0:
            self.imagenesVehiculos.image = [UIImage imageNamed:@"BICI_2"];
            break;
        case 1:
            self.imagenesVehiculos.image = [UIImage imageNamed:@"moto1"];
            break;
        case 2:
            self.imagenesVehiculos.image = [UIImage imageNamed:@"carro1"];
            break;
        case 3:
            self.imagenesVehiculos.image = [UIImage imageNamed:@"camioneta2"];
            break;
        default:
            break;
    }
    
}
@end
