//
//  ViewController.h
//  appPickerView2Cols
//
//  Created by Jorge on 17/04/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *etiqueta1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView1;


@end

