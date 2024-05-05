//
//  ViewController.h
//  appSegmentedControl
//
//  Created by Jorge on 24/04/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControlVehiculos;
@property (weak, nonatomic) IBOutlet UIImageView *imagenesVehiculos;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentAspecto;


- (IBAction)segmentValueChanged:(UISegmentedControl *)sender;
- (IBAction)segmentChangedValue:(UISegmentedControl *)sender;


@end

