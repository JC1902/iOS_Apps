//
//  ViewController.m
//  appSonidos
//
//  Created by Jorge on 23/04/24.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    AVAudioPlayer *audioPlayer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *path = [ NSString stringWithFormat:@"%@/mariobros.mp3", [[NSBundle mainBundle] resourcePath] ];
    
    NSURL *sonidoUrl = [NSURL fileURLWithPath:path];
    audioPlayer = [[AVAudioPlayer alloc ]initWithContentsOfURL:sonidoUrl error:nil];
    
    audioPlayer.volume = 20.0;
    [audioPlayer play];
}
- (IBAction)botonPlay:(UIButton *)sender {
    
    [audioPlayer play];
    
}

- (IBAction)botonPausa {
    
    [audioPlayer pause];
    
}

- (IBAction)botonStop:(id)sender {
    
    [audioPlayer stop];
    
}


@end
